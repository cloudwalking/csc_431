//make certain structuress global, then propagate changes
tree grammar EvilCFG;

options {
   language = Java;
   tokenVocab = Evil;
   ASTLabelType = CommonTree;
}

@header {
   import java.util.LinkedList;
   import java.io.File;
   import java.io.FileWriter;
   import java.io.BufferedWriter;
}

@members{
   RegTable regTable = new RegTable();
   int uniqueBlock = 0, uniqueStatement = 0;
   String currentFunction = "";
   boolean debug = false;
}

program[String fileName, Boolean print, Boolean printSparc]
   : ^(PROGRAM types declarations cfgList=functions) {
      if(print) {
         BufferedWriter codeWriter = null;
         if(!debug) {
            /*if (fileName.indexOf(".") == -1) {
               System.err.println("filename is: " + fileName);
               System.exit(1);
            }
            fileName = fileName.substring(0, fileName.indexOf("."));*/
            try {
               String sourceFile = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length());
               if (printSparc)
                  fileName = fileName.replace(".ev", ".s");
               else if (!printSparc)
                  fileName = fileName.replace(".ev", ".il");

               File tmpFile = new File(fileName);
               tmpFile.createNewFile();
               //tmpFile.setWritable(true);
               codeWriter = new BufferedWriter(new FileWriter(tmpFile));
               codeWriter.write(".file\t\"" + sourceFile + "\"\n");
               Block.printSparcConstants(codeWriter);
            }
            catch (java.io.IOException e) {
               System.err.println("Error initializing file writer: ");
               e.printStackTrace();
            }
         }
         for (Block block:cfgList) {
            if (debug) {
               block.reedPrint(0, printSparc);
            }
            else if (!debug) {
               block.filePrint(codeWriter, printSparc);
            }
         }
         try {
            codeWriter.close();
         }
         catch (java.io.IOException e) {
            System.err.println("Error closing file writer: ");
            e.printStackTrace();
         }
         regTable.print();
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

decl returns [String id = null]
   : ^(DECL ^(TYPE type) i=ID{$id=$i.text;})
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
   : list_id+
   ;

list_id returns [int reg]
   : id=ID {
        $reg = regTable.newRegister(currentFunction+$id.text);
     }
   ;

functions returns [LinkedList<Block> cfgList = new LinkedList<Block>()]
   : ^(FUNCS (topBlock=function {
/*        LinkedList<Instruction> main = new LinkedList<Instruction>();
        main.add(new Instruction("CALL", "main"));
        $topBlock.entry.addILoc(main);*/
        cfgList.add($topBlock.entry);
     })*)
   ;

function returns [Block entry = null]
   : ^(FUN id=ID {
        currentFunction = $id.text;
        //for CFG
        $entry = new Block("#function-entry");
        $entry.addLabel($id.text);
        LinkedList<Instruction> beginFunc = new LinkedList<Instruction>();
        beginFunc.add(new Instruction("SAVE"));

        Block exit = new Block("#function-exit");
        LinkedList<Instruction> endFunc = new LinkedList<Instruction>();
        endFunc.add(new Instruction("RESTORE"));
     }
     iloc=parameters[$id.text] ^(RETTYPE return_type) declarations {
        beginFunc.addAll(iloc);
        //allocate next activation record here
        $entry.addILoc(beginFunc);
     }
     //for CFG
     head = statement[new Block("#function-body"), exit] {
        $entry.addNext(head);
     })
   ;

parameters[String functionLabel] returns [LinkedList<Instruction> 
instructions = new LinkedList<Instruction>()]
@init { int count = 0; }
   : ^(PARAMS
      (id=decl {
         int reg = regTable.newRegister($functionLabel + $id.id);
         Instruction newInst = new Instruction("LOADI", count, 
          regTable.getImmRegister());
         newInst.setComment("parameter: put counter into immediate reg");
         $instructions.add(newInst);
         newInst = new Instruction("STIN", reg, regTable.getImmRegister());
         newInst.setComment("parameter: store-in param '" + $id.id +
          "' in reg " + reg);
         $instructions.add(newInst);
         count += 4;
      })*)
   ;

return_type
   : type
   | VOID
   ;

statement[Block head, Block exit] returns [Block top = null]
   : ^(BLOCK ^(STMTS {
        $top = head;
//        $top.addLabel("Block " + (uniqueBlock++));
        Block end = null;
     }
     ({ end = new Block(/*"statements"*/); } statement[head, end] { head = 
end; })* {
        if (end != null)
           end.addNext(exit);
     }))

   | ^(STMTS {
        $top = head;
        //$top.addLabel("Compound Statement");
        Block end = null;
     }
     ({ end = new Block(/*"statements"*/); } statement[head, end] { head = 
end; })* {
        if (end != null)
           end.addNext(exit);
     })

   | iloc=assignment {
        head.addLabel(".S" + (uniqueStatement++));
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=print {
        head.addLabel(".S" + (uniqueStatement++));
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=read {
        head.addLabel(".S" + (uniqueStatement++));
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | ^(IF {
         int guardBooleanReg = regTable.newRegister();
      }
      iloc=expression[guardBooleanReg] {
        String thenLabel = ".S" + uniqueStatement++;
        String elseLabel = ".S" + uniqueStatement++;
        String endLabel = ".S" + uniqueStatement++;
        
        LinkedList<Instruction> instructions = new LinkedList<Instruction>();
        Instruction newInst;

        // Add guard instructions
        head.addLabel("#if-guard");
        head.addILoc($iloc.instructions);
        
        // If guard evaluates to false, bail out
        newInst = new Instruction("COMPI", guardBooleanReg, 1);
        newInst.setComment("if: compare guard result (reg " + guardBooleanReg +
         ") to true");
        instructions.add(newInst);
        newInst = new Instruction("EQ", regTable.getCCRegister(), thenLabel, 
         elseLabel);
        newInst.setComment("if: branch true: '" + thenLabel + "' false: '" +
         elseLabel + "'");
        instructions.add(newInst);
        
        head.addILoc(instructions);

        Block end = new Block("#end-if");
        end.addLabel(endLabel);
        end.addNext(exit);
     }
     thenHead = statement[new Block("#then-branch"), end] {
        $thenHead.top.addLabel(thenLabel);
        head.addNext($thenHead.top);
        
        // Jump to exit block
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("JUMPI", endLabel);
        newInst.setComment("then: jump to #end-if '" + endLabel + "'");
        instructions.add(newInst);
        $thenHead.top.addILoc(instructions);
     }
     (elseHead = statement[new Block("#else Branch"), end] {
        $elseHead.top.addLabel(elseLabel);
        head.addNext($elseHead.top);
        
        // Jump to exit block
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("JUMPI", endLabel);
        newInst.setComment("if: jump to #end-if '" + endLabel + "'");
        instructions.add(newInst);
        $elseHead.top.addILoc(instructions);
        
        $top = head;
     })?)

   | ^(WHILE {int guardBooleanReg = regTable.newRegister();}
     iloc=expression[guardBooleanReg] {
        String guardLabel = ".S" + uniqueStatement++;
        String bodyLabel = ".S" + uniqueStatement++;
        String endLabel = ".S" + uniqueStatement++;
        LinkedList<Instruction> instructions;
        Instruction newInst;
        
        head.addLabel("#while-guard");
        head.addLabel(guardLabel);
        // Add guard instructions
        head.addILoc($iloc.instructions);
        
        // If guard evaluates to false, bail out
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("LOADI", 1, regTable.getImmRegister());
        newInst.setComment("while: set immediate 1 (true)");
        instructions.add(newInst);
        newInst = new Instruction("COMPI", guardBooleanReg, 
         regTable.getImmRegister());
        newInst.setComment("while: compare guard result (reg " +
         guardBooleanReg + ") to true");
        instructions.add(newInst);
        newInst = new Instruction("EQ", regTable.getCCRegister(), bodyLabel, 
         endLabel);
        newInst.setComment("while: branch true: '" + bodyLabel +
         "' false: '" + endLabel + "'");
        instructions.add(newInst);

        head.addILoc(instructions);
        
        Block end = new Block("#end-while");
        end.addLabel(endLabel);
        end.addNext(exit);
     }
     body = statement[new Block("#while-body"), head] {
        $body.top.addLabel(bodyLabel);
        
        // Jump back to the guard, to loop
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("LOADI", 0, regTable.getImmRegister());
        newInst.setComment("while: set immediate 0 (no offset)");
        instructions.add(newInst);
        newInst = new Instruction("JUMPI", guardLabel);
        newInst.setComment("while: jump back to guard");
        instructions.add(newInst);
        
        $body.top.addILoc(instructions);
        
        head.addNext($body.top);
        head.addNext(end);
        $top = head;
     } iloc=expression[regTable.newRegister()])

   | iloc=delete {
        head.addILoc($iloc.instructions);
        head.addLabel(".S" + (uniqueStatement++));
        head.addNext(exit);
        $top = head;
     }

   | iloc=ret {
        head.addILoc($iloc.instructions);
        head.addLabel(".S" + (uniqueStatement++));
        head.addNext(exit);
        $top = head;
     }

   | iloc=invocation {
        head.addILoc($iloc.instructions);
        head.addLabel(".S" + (uniqueStatement++));
        head.addNext(exit);
        $top = head;
     }
   ;

assignment returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister();
        int r2 = regTable.newRegister(); }
   : ^(ASSIGN exp=expression[r1] leftIloc=lvalue[r2]) {
        //$instructions.addAll(0, $lval.instructions);
         $instructions.addAll(0, $exp.instructions);
         $instructions.addAll(0, $leftIloc.instructions);
         
         // Set immediate?
         // In the middle of switching this up.
/*
         Instruction newInst = new Instruction(
            "STAI", r1, 0, $destReg.register);
         newInst.setComment("store: reg "+$destReg.register+" gets val in reg 
"+r1);
         $instructions.add(newInst);
*/
      }
   ;

print returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(PRINT exp=expression[r1] (ENDL)?) {
//check to see if ENDL is present
        $instructions.addAll(0, $exp.instructions);
        Instruction newInst = new Instruction("PRINT", r1);
        newInst.setComment("print: print contents of reg "+r1);
        $instructions.add(newInst);
     }
   ;

read returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
// TODO fix to work with new lval
   : ^(READ register=lvalue[0]) {
//        $instructions.add(new Instruction("READ", register));
     }
   ;

delete returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(DELETE exp=expression[r1]) {
        $instructions.addAll(0, $exp.instructions);
        $instructions.add(new Instruction("DEL", r1));
     }
   ;

ret returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
@init { int r1 = regTable.getReturnRegister(); }
   : ^(RETURN (exp=expression[r1])?) {
        if (exp != null)
           $instructions.addAll(0, $exp.instructions);
        $instructions.add(new Instruction("RET"));
     }
   ;

invocation returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
   : ^(INVOKE id=ID 
//            { currentFunction = $id.text; }
            args=arguments) {
        $instructions.addAll(0, args);
        Instruction newInst = new Instruction("CALL", $id.text);
        newInst.setComment("invocation: call function " + $id.text);
        $instructions.add(newInst);
     }
   ;

lvalue[int resultReg] returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
   : ^(DOT structId=subvalue fieldId=ID) {
      // store from mem to register
   }
   | id=ID {
        int reg = regTable.lookupId(currentFunction+$id.text);
        Instruction newInst = new Instruction("ADDI", reg, 0, resultReg);
        newInst.setComment("lvalue: got an id stored in reg " + reg +
         ", stuck it in reg " + resultReg);
        $instructions.add(newInst);
     }
   ;

subvalue returns [int register]
   : ^(DOT structId=subvalue fieldId=ID)
    // loadai
//      Instruction newInst = new Instruction("");
//      newInst.setComment("");
   | id=ID {
        $register = regTable.lookupId(currentFunction+$id.text);
     }
   ;

// Returns a list of its instructions
expression [int resultReg] returns [LinkedList<Instruction> instructions = 
new LinkedList<Instruction>()]
   : ^(op=(AND | OR | PLUS | MINUS | TIMES | DIVIDE) {
        int lexprReg = regTable.newRegister();
        int rexprReg = regTable.newRegister();
     }

     lexpr=expression[lexprReg] 
     rexpr=expression[rexprReg]) {
        $instructions.addAll(0, $lexpr.instructions);
        $instructions.addAll(0, $rexpr.instructions);
        Instruction newInst = new Instruction(
          $op.text, lexprReg, rexprReg, resultReg);
        newInst.setComment("expression: reg " + lexprReg + " " + $op.text +
         " " + rexprReg + " in reg " + resultReg);
        $instructions.add(newInst);
     }

   | ^(op=(EQ | LT | GT | NE | LE | GE) {
        int lexprReg = regTable.newRegister();
        int rexprReg = regTable.newRegister();
     }

     lexpr=expression[lexprReg] 
     rexpr=expression[rexprReg]) {
        $instructions.addAll(0, $lexpr.instructions);
        $instructions.addAll(0, $rexpr.instructions);

        // Do the comparison, set cc
        Instruction newInst = new Instruction(
            "COMP", lexprReg, rexprReg, regTable.getCCRegister());
        newInst.setComment("expression: compare: reg " + lexprReg +
         " to " + rexprReg + ", store in cc-reg");
        $instructions.add(newInst);
        
        // Here we set the return register to true or false
        String trueLabel = ".S" + uniqueStatement++;
        String falseLabel = ".S" + uniqueStatement++;
        String doneLabel = ".S" + uniqueStatement++;
        
        // Do the comparison
        newInst = new Instruction($op.text, regTable.getCCRegister(), 
         trueLabel, falseLabel);
        newInst.setComment("expression: branch true: '" + trueLabel +
         "' false: '" + falseLabel + "'");
        $instructions.add(newInst);
        
        // If comparison is true
        newInst = new Instruction("LABEL", trueLabel);
        newInst.setComment("expression: TRUE branch label '"+trueLabel+"'");
        $instructions.add(newInst);
        // Set result register to true
        newInst = new Instruction("LOADI", 1, resultReg);
        newInst.setComment("expression: evaluated to true, setting resultReg " +
         resultReg);
        $instructions.add(newInst);
        // Go to finish
        newInst = new Instruction("JUMPI", doneLabel);
        newInst.setComment("expression: done, move on '"+doneLabel+"'");
        $instructions.add(newInst);
        
        // Comparison was false
        newInst = new Instruction("LABEL", falseLabel);
        newInst.setComment("expression: FALSE branch label '" + falseLabel + "'");
        $instructions.add(newInst);
        // Set result register to false
        newInst = new Instruction("LOADI", 0, resultReg);
        newInst.setComment("expression: evaluated to false, setting resultReg " +
         resultReg);
        $instructions.add(newInst);
        
        // Finish
        newInst = new Instruction("LABEL", doneLabel);
        newInst.setComment("expression: done with comparison");
        $instructions.add(newInst);
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

   | ^(DOT { int r1 = regTable.newRegister(); } expr=expression[r1] fieldId=ID) {
        // Load
        int leftRegister = regTable.lookupId(currentFunction+$fieldId.text);
        if(-1 == leftRegister) {
             leftRegister = regTable.lookupId($fieldId.text);
        }
        int offset = 0; // set this offset somehow:
        // lookup id of struct, find type in symtable,
        // get offset for that field, add to
        // offset for all other fields
        Instruction newInst = new Instruction("LOADAI", r1, offset, 
          resultReg);
        newInst.setComment("dot: load from pointer '" + $fieldId.text +
         "' (reg " + r1 + "), store in reg " + resultReg);
        $instructions.add(newInst);
        
        // Or figure out last label and loadglobal
     }
        

   | ^(INVOKE id=ID args=arguments) {
        $instructions.addAll(0, args);
        Instruction newInst = new Instruction("CALL", $id.text);
        newInst.setComment("invocation: call function " + $id.text);
        $instructions.add(newInst);
     }
   | id=ID {
        int immRegister = regTable.getImmRegister();
        
        Instruction newInst = new Instruction("LOADI", 0, immRegister);
        newInst.setComment("id: set immediate 0");
        $instructions.add(newInst);
      
        int targetRegister = regTable.lookupId(currentFunction  + $id.text);
        if(-1 == targetRegister) {
           targetRegister = regTable.lookupId($id.text);
        }

        newInst = new Instruction("LOADAI",
         targetRegister, immRegister, resultReg);
        newInst.setComment("id: load '" + currentFunction + $id.text +
         "' from mem to reg " + resultReg);
        $instructions.add(newInst);
     }

   | i=INTEGER {
//        int immRegister = regTable.newRegister();
        Instruction newInst = new Instruction("LOADI", 
                                    Integer.parseInt($i.text),
                                    resultReg);
        newInst.setComment("int: reg "+resultReg+" gets val "+ 
         Integer.parseInt($i.text));
        $instructions.add(newInst);
     }

   | TRUE {
        Instruction newInst = new Instruction("LOADI", 1, resultReg);
        newInst.setComment("bool: reg "+resultReg+" gets true");
        $instructions.add(newInst);
     }
   | FALSE {
        Instruction newInst = new Instruction("LOADI", 0, resultReg);
        newInst.setComment("bool: reg "+resultReg+" gets false");
        $instructions.add(newInst);
     }

   | ^(NEW id=ID) {
/*
        $instructions.add(new Instruction(
         Instruction.Operator.NEW, resultReg, $id.text));
*/
     }

   | NULL {
        Instruction newInst = new Instruction("LOADI", 0, resultReg);
        newInst.setComment("null: reg "+resultReg+" gets false");
        $instructions.add(newInst);
     }
   ;

arguments returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
   : inst=arg_list {
       $instructions = $inst.instructions; 
     }
   ;

arg_list returns [LinkedList<Instruction> instructions = new 
LinkedList<Instruction>()]
@init{ int srcReg = regTable.newRegister();
       int count = 0; }
   : ^(ARGS (exprInstr=expression[srcReg] {
        Instruction newInst;
        $instructions.addAll(0, $exprInstr.instructions);
        newInst = new Instruction("LOADI", count, regTable.getImmRegister());
        newInst.setComment("argument: set immediate reg to " + count);
        $instructions.add(newInst);
        newInst = new Instruction("STOUT", srcReg, 
         regTable.getImmRegister());
        newInst.setComment("argument: store-out param in reg " + srcReg);
        $instructions.add(newInst);
        count += 4;
     })+)
   | ARGS
   ;
