//make certain structuress global, then propagate changes
tree grammar EvilCFG;

options {
   language = Java;
   tokenVocab = Evil;
   ASTLabelType = CommonTree;
}

@members{
   RegTable regTable = new RegTable();
}

@header {
   import java.util.LinkedList;
}

program
   : ^(PROGRAM types declarations cfgList=functions) {
        for (Block block : cfgList) {
           block.printBlock();
        }
     }
   ;
  
types
   : ^(TYPES type_sub)
   |   TYPES
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
   : ID+
   ;
   
functions returns [LinkedList<Block> cfgList = new LinkedList<Block>()]
   : ^(FUNCS (topBlock=function {cfgList.add($topBlock.entry);})*)
   ;

function returns [Block entry = null]
   : ^(FUN id=ID {
        //for CFG
        $entry = new Block();
        Block exit = new Block();
     }
     parameters ^(RETTYPE return_type) declarations
     //for CFG
     head = statement[new Block(), exit] {
        $entry.addNext(head);
     })
   ;

parameters
   : ^(PARAMS decl*)
   ;

return_type returns [String t = null]
   : type
   | VOID { $t = SymTable.voidType(); }
   ;

statement[Block head, Block exit] returns [Block top = null]
@init{ System.out.println("statement "); }
   : ^(BLOCK ^(STMTS {
        $top = head;
        $top.addLabel("Block");
        Block end = null;
     }
     ({ end = new Block(); } statement[head, end] { head = end; })* {
        if (end != null)
           end.addNext(exit);
     }))

   | ^(STMTS {
        $top = head;
        $top.addLabel("Compound Statement");
        Block end = null;
     }
     ({ end = new Block(); } statement[head, end] { head = end; })* {
        if (end != null)
           end.addNext(exit);
     })

   | iloc=assignment {
        /*head.addILoc(iloc);*/
        head.addLabel("assignment");
        head.addNext(exit);
        $top = head;
     }

   | iloc=print {
        /*head.addILoc(iloc);*/
        head.addLabel("print");
        head.addNext(exit);
        $top = head;
     }

   | iloc=read {
        /*head.addILoc(iloc);*/
        head.addLabel("read");
        head.addNext(exit);
        $top = head;
     }

   | ^(IF iloc=expression[regTable.newRegister()] {
        /*head.addILoc(iloc);*/
        head.addLabel("IF");
        Block end = new Block();
        end.addNext(exit);
     }
     thenHead = statement[new Block(), end] {
        $thenHead.top.addLabel("then");
        head.addNext($thenHead.top);
     }
     (elseHead = statement[new Block(), end] {
        $elseHead.top.addLabel("else");
        head.addNext($elseHead.top);
        $top = head;
     })?)

   | ^(WHILE iloc=expression[regTable.newRegister()] {
        /*head.addILoc(iloc);*/
        head.addLabel("WHILE");
        Block end = new Block();
        end.addNext(exit);
     }
     body = statement[new Block(), head] {
        $body.top.addLabel("while body");
        head.addNext($body.top);
        head.addNext(end);
        $top = head;
     })

   | iloc=delete {
        /*head.addILoc(iloc);*/
        head.addLabel("delete");
        head.addNext(exit);
        $top = head;
     }

   | iloc=ret {
        /*head.addILoc(iloc);*/
        head.addLabel("ret");
        head.addNext(exit);
        $top = head;
     }

   | iloc=invocation {
        /*head.addILoc(iloc);*/
        head.addLabel("invocation");
        head.addNext(exit);
        $top = head;
     }
   ;

assignment returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(ASSIGN exp=expression[r] lval=lvalue)
      {   // Lookup right register
         // Store
      }
   ;

print  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(PRINT exp=expression[r] (ENDL)?)
   ;

read returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(READ exp=lvalue)
   ;

delete returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(DELETE exp=expression[r])
   ;

ret  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister();System.out.println("ret"); }
   : ^(RETURN (exp=expression[r])?)
        { System.out.println("exp is " + exp); }
   ;

invocation returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(INVOKE id=ID arguments)
      //{ $node = new InstructionNode(Instruction.Operation.JUMPI, $id, $exp); }
   ;

lvalue  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(DOT structId=subvalue fieldId=ID)
   | valId=ID
   ;

subvalue returns [String t = null]
   : ^(DOT structId=subvalue fieldId=ID)
   | id=ID
   ;

// Returns a list of it's instructions
expression [int resultReg] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(), r2 = regTable.newRegister(); }
   : ^(op=(AND | OR | EQ | LT | GT | NE | LE | GE | PLUS | MINUS | TIMES | DIVIDE)
      lexpr=expression[r1] rexpr=expression[r2]) {
System.out.println("operator in expression is " + $op.token.getText());
        $instructions.addAll(0, $lexpr.instructions);
        $instructions.addAll(0, $rexpr.instructions);
        $instructions.add(new Instruction(Instruction.getOperator($op.token.getText()), r1, r2, resultReg));
     }
   | ^(NEG expr=expression[r1]) {
        $instructions.addAll(0, $expr.instructions);
        $instructions.add(new Instruction(Instruction.Operator.LOADI, r2, -1));
        $instructions.add(new Instruction(Instruction.Operator.MULT, r1, r2, resultReg));
     }
   | ^(NOT expr=expression[r1])
        // Something
   | ^(DOT expr=expression[r1] fieldId=ID)
        // Load
        // Store
   | ^(INVOKE id=ID arguments)
        // Jump
   | id=ID
        // Load into resultReg
   | i=INTEGER {
        //should be an immediate?
     }
   | TRUE {
        $instructions.add(new Instruction(
         Instruction.Operator.LOADI, resultReg, 1));
     }
   | FALSE {
        $instructions.add(new Instruction(
         Instruction.Operator.LOADI, resultReg, 0));
     }
   | ^(NEW id=ID)
        // Allocate
   | NULL
   ;

arguments
@init { int r = regTable.newRegister(); }
   : arg_list[r]
   ;

arg_list[int resultReg]
   : ^(ARGS expression[resultReg]+)
   | ARGS
   ;
