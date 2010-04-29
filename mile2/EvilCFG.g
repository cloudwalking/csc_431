//make certain structuress global, then propagate changes
tree grammar EvilCFG;

options {
   language = Java;
   tokenVocab = Evil;
   ASTLabelType = CommonTree;
}

@header {
   import java.util.LinkedList;
}

@members{
   RegTable regTable = new RegTable();
   LabelTable labTable = new LabelTable();
   LinkedList<Instruction> globalInstrs = new LinkedList<Instruction>();
   int uniqueBlock = 0, uniqueStatement = 0;
}

program
   : ^(PROGRAM types declarations cfgList=functions) {
        for (Block block:cfgList) {
           block.printBlock();
        }
     }
   ;

types
   : ^(TYPES type_sub)
   | TYPES
   ;

type_sub
   : type_declaration type_sub
   | 
   ;

type_declaration
   : ^(STRUCT ID nested_decl)
   ;

nested_decl
   : decl+
   ;

decl
   : ^(DECL ^(TYPE type) ID)
   ;

type
   :  INT
   |  BOOL
   |  ^(STRUCT id=ID)
   ;

declarations
   : ^(DECLS declaration*)
   ;

declaration
   : ^(DECLLIST ^(TYPE type) id_list)
   ;

id_list
   : (localReg=list_id {
//need to add storeglobal instruction, which requires a new Instruction constructor
//        $globalInstrs.add(
//         new Instruction("STGLBL", 
     })+
   ;

list_id returns [int reg]
   : id=ID {
        $reg = regTable.newRegister($id.text);
     }
   ;

functions returns [LinkedList<Block> cfgList = new LinkedList<Block>()]
   : ^(FUNCS (topBlock=function {
        cfgList.add($topBlock.entry);
     })*)
   ;

function returns [Block entry = null]
   : ^(FUN id=ID {
        //for CFG
        $entry = new Block();
        $entry.addLabel($id.text);
        Block exit = new Block();
     }
     parameters ^(RETTYPE return_type) declarations
     //for CFG
     head = statement[new Block("function body"), exit] {
        $entry.addNext(head);
     })
   ;

parameters
   : ^(PARAMS decl*)
   ;

return_type
   : type
   | VOID
   ;

statement[Block head, Block exit] returns [Block top = null]
@init{ System.out.println("statement "); }
   : ^(BLOCK ^(STMTS {
        $top = head;
        $top.addLabel("Block " + (uniqueBlock++));
        Block end = null;
     }
     ({ end = new Block(/*"statements"*/); } statement[head, end] { head = end; })* {
        if (end != null)
           end.addNext(exit);
     }))

   | ^(STMTS {
        $top = head;
        //$top.addLabel("Compound Statement");
        Block end = null;
     }
     ({ end = new Block(/*"statements"*/); } statement[head, end] { head = end; })* {
        if (end != null)
           end.addNext(exit);
     })

   | iloc=assignment {
        head.addLabel("S" + (uniqueStatement++));
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=print {
        head.addLabel("S" + (uniqueStatement++));
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=read {
        head.addLabel("S" + (uniqueStatement++));
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | ^(IF iloc=expression[regTable.newRegister()] {
        head.addILoc($iloc.instructions);
        head.addLabel("S" + (uniqueStatement++));
        Block end = new Block("end if");
        end.addNext(exit);
     }
     thenHead = statement[new Block("then branch"), end] {
        $thenHead.top.addLabel("S" + (uniqueStatement++));
        head.addNext($thenHead.top);
     }
     (elseHead = statement[new Block("else Branch"), end] {
        $thenHead.top.addLabel("S" + (uniqueStatement++));
        head.addNext($elseHead.top);
        $top = head;
     })?)

   | ^(WHILE iloc=expression[regTable.newRegister()] {
        head.addILoc($iloc.instructions);
        head.addLabel("S" + (uniqueStatement++));
        Block end = new Block("end while");
        end.addNext(exit);
     }

     body = statement[new Block("while body"), head] {
        $body.top.addLabel("S" + (uniqueStatement++));
        head.addNext($body.top);
        head.addNext(end);
        $top = head;
     } iloc=expression[regTable.newRegister()])

   | iloc=delete {
        head.addILoc($iloc.instructions);
        head.addLabel("S" + (uniqueStatement++));
        head.addNext(exit);
        $top = head;
     }

   | iloc=ret {
        head.addILoc($iloc.instructions);
        head.addLabel("S" + (uniqueStatement++));
        head.addNext(exit);
        $top = head;
     }

   | iloc=invocation {
        head.addILoc($iloc.instructions);
        head.addLabel("S" + (uniqueStatement++));
        head.addNext(exit);
        $top = head;
     }
   ;

assignment returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(ASSIGN exp=expression[r1] destReg=lvalue) {
        //$instructions.addAll(0, $lval.instructions);
         $instructions.addAll(0, $exp.instructions);
         $instructions.add(new Instruction(
          "STAI", r1, 0, $destReg.register));
      }
   ;

print returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(PRINT exp=expression[r1] (ENDL)?) {
//check to see if ENDL is present
        $instructions.addAll(0, $exp.instructions);
        $instructions.add(new Instruction("PRINT", r1));
     }
   ;

read returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(READ register=lvalue) {
        $instructions.add(new Instruction("READ", register));
     }
   ;

delete returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(DELETE exp=expression[r1]) {
        $instructions.addAll(0, $exp.instructions);
        $instructions.add(new Instruction("DEL", r1));
     }
   ;

ret returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.getReturnRegister(); }
   : ^(RETURN (exp=expression[r1])?) {
        $instructions.addAll(0, $exp.instructions);
        $instructions.add(new Instruction("RET"));
     }
   ;

invocation  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(INVOKE id=ID args=arguments) {
        // Store the args in arg registers
        $instructions.add(new Instruction("CALL", $id.text));
     }
   ;

lvalue returns [int register]
   : ^(DOT structId=subvalue fieldId=ID)
   | id=ID {
        $register = regTable.lookupId($id.text);
     }
   ;

subvalue returns [int register]
   : ^(DOT structId=subvalue fieldId=ID)
   | id=ID {
        $register = regTable.lookupId($id.text);
     }
   ;

// Returns a list of it's instructions
expression [int resultReg] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(op=(AND | OR | PLUS | MINUS | TIMES | DIVIDE) {
        int lexprReg = regTable.newRegister();
        int rexprReg = regTable.newRegister();
     }

     lexpr=expression[lexprReg] 
     rexpr=expression[rexprReg]) {
        $instructions.addAll(0, $lexpr.instructions);
        $instructions.addAll(0, $rexpr.instructions);

        $instructions.add(new Instruction(
         $op.text, lexprReg, rexprReg, resultReg));
     }

   | ^(op=(EQ | LT | GT | NE | LE | GE) {
        int lexprReg = regTable.newRegister();
        int rexprReg = regTable.newRegister();
     }

     lexpr=expression[lexprReg] 
     rexpr=expression[rexprReg]) {
        $instructions.addAll(0, $lexpr.instructions);
        $instructions.addAll(0, $rexpr.instructions);

        $instructions.add(new Instruction(
         "COMP", lexprReg, rexprReg, resultReg));
         //"COMP", lexprReg, rexprReg, regTable.getCCRegister()));
     }

   | ^(NEG {
        int srcReg1 = regTable.newRegister();
        int srcReg2 = regTable.newRegister();
     }

     expr=expression[srcReg1]) {
        $instructions.addAll(0, $expr.instructions);

        $instructions.add(
         new Instruction("LOADI", -1, srcReg2));

        $instructions.add(new Instruction(
         "TIMES", srcReg1, srcReg2, resultReg));
     }

   | ^(NOT {
        int srcReg = regTable.newRegister();
        int immReg = regTable.newRegister();
     }

     expr=expression[srcReg]) {
        $instructions.add(
         new Instruction("LOADI", 1, immReg));

        $instructions.add(new Instruction(
         "XORI", srcReg, immReg, resultReg));
     }

   | ^(DOT { int r1 = regTable.newRegister(); } expr=expression[r1] fieldId=ID)
      // Load
      // Store

   | ^(INVOKE id=ID args=arguments) {
        // Jump
        $instructions.add(
         new Instruction("CALL", $id.text));
     }
   | id=ID {
        int immRegister = regTable.newRegister();

        $instructions.add(
         new Instruction("LOADI", 0, immRegister));

        $instructions.add(new Instruction(
         "LOADAI", regTable.lookupId($id.text), immRegister, resultReg));
     }

   | i=INTEGER {
        int immRegister = regTable.newRegister();
        $instructions.add(
         new Instruction("LOADI", Integer.parseInt($i.text), immRegister));
     }

   | TRUE {
        $instructions.add(
         new Instruction("LOADI", 1, resultReg));
     }
   | FALSE {
        $instructions.add(
         new Instruction("LOADI", 0, resultReg));
     }

   | ^(NEW id=ID) {
//        $instructions.add(new Instruction(
  //       Instruction.Operator.NEW, resultReg, $id.text));
     }

   | NULL
        // Something
   ;

arguments
   : arg_list
   ;

arg_list returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init{ int srcReg = regTable.newRegister(); }
   : ^(ARGS (exprInstr=expression[srcReg] {
        int newLocal = regTable.newRegister();
        int offSetReg = regTable.newRegister();

        $instructions.addAll(0, $exprInstr.instructions);
        $instructions.add(
         new Instruction("LOADI", 0, offSetReg));
        $instructions.add(
         new Instruction("STIN", srcReg, newLocal, offSetReg));
     })+)
   | ARGS
   ;
