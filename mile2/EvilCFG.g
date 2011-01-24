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
   RegTable regTable;
   FunTable funtable;
   StructTable stable;
   int uniqueBlock = 0, uniqueStatement = 0;
   String currentFunction = "";
   String currentStruct = "";
   boolean shouldStore = false;
}

program[StructTable structTable, FunTable fun, RegTable regs] returns
 [LinkedList<Block> returnBlockList = new LinkedList<Block>()]
@init{ stable = structTable; funtable = fun; regTable = regs; }
   : ^(PROGRAM types declarations cfgList=functions) {
        $returnBlockList = cfgList;
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

declarations returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]  
   : ^(DECLS (instrs=declaration {instructions.addAll(instrs);})*)
   ;

declaration returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(DECLLIST ^(TYPE t=type) instrs=id_list[$t.text] {instructions.addAll(instrs);})
   ;

id_list[String type] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : (instr=list_id[$type] {instructions.addAll(instr);})+
   ;

list_id[String type] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : id=ID {
        int reg = regTable.newRegister(currentFunction+$id.text);
        /* Not sure whether structs have to be initilized or not... I've seen it done both ways. 
         * Thus, doing it both ways.
         */
        if($type.contains("struct")) {
            $type = $type.substring(6); // no space at end
            instructions.add(new Instruction("NEW", stable.getSize($type), regTable.getReturnRegister()));
//            instructions.add(new Instruction("MOV", new Register(regTable.getReturnRegister(), "\%o0"), reg));
            instructions.add(new Instruction("MOV", regTable.getReturnRegister(), reg));
            /* make the fields null */
            for(int offset=0; offset<stable.getSize($type); offset+=4) { // increase by INT size
               instructions.add(new Instruction("STAI",
                                                   regTable.getZeroRegister(),
                                                   reg,
                                                   offset));
            }
         }
     }
   ;

functions returns [LinkedList<Block> cfgList = new LinkedList<Block>()]
   : ^(FUNCS (topBlock=function {
        cfgList.addFirst($topBlock.entry);
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
     }
     iloc=parameters[$id.text] ^(RETTYPE return_type) declIloc=declarations {
        beginFunc.addAll(iloc);
        //allocate next activation record here
        $entry.addILoc(beginFunc);
        
        // malloc structs //* //*a
        //$entry.addILoc($declIloc.instructions);

        //for CFG
        Block body = new Block("#function-body");

//*
body.addILoc($declIloc.instructions);

        body.addPrevious($entry);
        $entry.addNext(body);

     }
     statement[body]) {
        body.addNext(exit);
        exit.addPrevious(body);
     }
   ;

parameters[String functionLabel] returns [LinkedList<Instruction> 
 instructions = new LinkedList<Instruction>()]
@init { int inReg = 0; }
   : ^(PARAMS
      (id=decl {
         int reg = regTable.newRegister($functionLabel + $id.id);
         int src = regTable.getInRegister(inReg++);
         $instructions.add(new Instruction(
          "STIN", src, reg));
      })*)
   ;

return_type
   : type
   | VOID
   ;

statement[Block head] returns [Block block = null]
   : ^(BLOCK ^(STMTS(temp = statement[head]{ 
        if ($temp.block == null) System.out.println("temp is null when head is " + head);
        head = $temp.block; })*) {
        $block = head;
     })

   | ^(STMTS (temp = statement[head]{
        if ($temp.block == null) System.out.println("temp is null when head is " + head);
        head = $temp.block; })* {
        $block = head;
     })

   | iloc=assignment {
        head.addILoc($iloc.instructions);
        $block = head;
     }

   | iloc=print {
        head.addILoc($iloc.instructions);
        $block = head;
     }

   | iloc=read {
        head.addILoc($iloc.instructions);
        $block = head;
     }

   | ^(IF {
         int guardBooleanReg = regTable.newRegister();

         Block ifGuard = new Block();
         Block ifThen = new Block();
         Block ifElse = new Block();
         Block ifEnd = null;

         head.addNext(ifGuard);
         ifGuard.addPrevious(head);

         ifGuard.addNext(ifThen);
         ifThen.addPrevious(ifGuard);
      }
      iloc=expression[guardBooleanReg] {
        String thenLabel = ".S" + uniqueStatement++;
        String elseLabel = ".S" + uniqueStatement++;
        String endLabel = ".S" + uniqueStatement++;
        
        LinkedList<Instruction> instructions = new LinkedList<Instruction>();
        Instruction newInst;

        // Add guard instructions
        ifGuard.addLabel("#if-guard");
        ifGuard.addILoc($iloc.instructions);
        
        // If guard evaluates to false, bail out
        newInst = new Instruction("LOADI", 1, regTable.getImmRegister());
        instructions.add(newInst);

        newInst = new Instruction("COMP", guardBooleanReg,
         regTable.getImmRegister(), regTable.getCCRegister());
        newInst.setComment("if: compare guard result (reg " + guardBooleanReg +
         ") to true");
        instructions.add(newInst);
        newInst = new Instruction("EQ", regTable.getCCRegister(), thenLabel, 
         elseLabel);
        newInst.setComment("if: branch true: '" + thenLabel + "' false: '" +
         elseLabel + "'");
        instructions.add(newInst);
        
        ifGuard.addILoc(instructions);

     }
     thenNext = statement[ifThen] {
        ifThen.addLabel(thenLabel);
        
        // Jump to exit block
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("JUMPI", endLabel);
        newInst.setComment("then: jump to #end-if '" + endLabel + "'");
        instructions.add(newInst);
        $thenNext.block.addILoc(instructions);
     }
     (elseNext = statement[ifElse] {
        ifElse.addPrevious(ifGuard);
        ifElse.addLabel(elseLabel);
        
        // Jump to exit block
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("JUMPI", endLabel);
        newInst.setComment("if: jump to #end-if '" + endLabel + "'");
        instructions.add(newInst);
        $elseNext.block.addILoc(instructions);

     })?{
        ifEnd = new Block();

        $thenNext.block.addNext(ifEnd);
        ifEnd.addPrevious($thenNext.block);
        ifEnd.addLabel(endLabel);

        if (ifElse.getLabelList().isEmpty()) {
           ifEnd.addLabel(elseLabel);
           ifGuard.addNext(ifEnd);
           ifEnd.addPrevious(ifGuard);
        }
        else if (!ifElse.getLabelList().isEmpty()) {
           ifGuard.addNext(ifElse);
           $elseNext.block.addNext(ifEnd);
           ifEnd.addPrevious($elseNext.block);
        }

        $block = ifEnd;
     })

   | ^(WHILE {
        int guardBooleanReg = regTable.newRegister();

        Block whileGuard = new Block();
        Block whileBody = new Block();
        Block whileEnd = new Block();

        head.addNext(whileGuard);

        whileGuard.addPrevious(head);

        whileGuard.addNext(whileBody);
        whileGuard.addNext(whileEnd);

        whileBody.addPrevious(whileGuard);
        whileBody.addNext(whileGuard);

        whileEnd.addPrevious(whileGuard);
        //*
        whileEnd.addNext(whileGuard);
     }
     iloc=expression[guardBooleanReg] {
        String guardLabel = ".S" + uniqueStatement++;
        String bodyLabel = ".S" + uniqueStatement++;
        String endLabel = ".S" + uniqueStatement++;
        LinkedList<Instruction> instructions;
        Instruction newInst;
        
        whileGuard.addLabel("#while-guard");
        whileGuard.addLabel(guardLabel);
        // Add guard instructions
        whileGuard.addILoc($iloc.instructions);
        
        // If guard evaluates to false, bail out
        instructions = new LinkedList<Instruction>();
        newInst = new Instruction("LOADI", 1, regTable.getImmRegister());
        newInst.setComment("while: set immediate 1 (true)");
        instructions.add(newInst);

        newInst = new Instruction("COMP", guardBooleanReg, 
         regTable.getImmRegister(), regTable.getCCRegister());
        newInst.setComment("while: compare guard result (reg " +
         guardBooleanReg + ") to true");
        instructions.add(newInst);
        newInst = new Instruction("EQ", regTable.getCCRegister(), bodyLabel, 
         endLabel);
        newInst.setComment("while: branch true: '" + bodyLabel +
         "' false: '" + endLabel + "'");
        instructions.add(newInst);

        whileGuard.addILoc(instructions);
        
        whileEnd.addLabel(endLabel);
     }
     body = statement[whileBody] {
        whileBody.addLabel(bodyLabel);

        // Jump back to the guard, to loop
        instructions = new LinkedList<Instruction>();
        /*newInst = new Instruction("LOADI", 0, regTable.getImmRegister());
        newInst.setComment("while: set immediate 0 (no offset)");
        instructions.add(newInst);*/
        newInst = new Instruction("JUMPI", guardLabel);
        newInst.setComment("while: jump back to guard");
        instructions.add(newInst);

        $body.block.addILoc(instructions);
     
        //*
        $body.block.addNext(whileEnd);

        $block = whileEnd;
     } )

   | iloc=delete {
        head.addILoc($iloc.instructions);
        $block = head;
     }

   | iloc=ret {
        head.addILoc($iloc.instructions);
        $block = head;
     }

   | iloc=invocation {
        head.addILoc($iloc.instructions);
        $block = head;
     }
   ;

assignment returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister();
        /*int r2 = regTable.newRegister(); - lvalue has this, changing*/ }
   : ^(ASSIGN exp=expression[r1] leftIloc=lvalue[r1]) {
/*         $instructions.addAll(0, $leftIloc.instructions);
         Register lvalReg = null;
         LinkedList<Register> memAddr = null;
         if (!shouldStore) {
            lvalReg =
             $instructions.getLast().getSourceRegisterList().getFirst();
         }
         else {
            memAddr = $instructions.getLast().getSourceRegisterList();
         }
         $instructions.addAll(0, $exp.instructions);

         int offset = 0;

         Instruction newInst = null;
         newInst = new Instruction("MOV", r1, r2);

         $instructions.add(newInst);
         if (!shouldStore) {
            $instructions.add(new Instruction(
             "MOV", r2, lvalReg.getValue()));
         }
         else {
            $instructions.add(new Instruction(
             "STAI", r2, memAddr.removeFirst().getValue(),
             memAddr.removeFirst().getValue()));
         }
         shouldStore = false;
*/
         $instructions.addAll($exp.instructions);
         $instructions.addAll($leftIloc.instructions);
      }
   ;

print returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); boolean newLine = false; }
   : ^(PRINT exp=expression[r1] (ENDL { newLine = true; })?) {
//check to see if ENDL is present
        $instructions.addAll(0, $exp.instructions);
        if (newLine == false) {
           Instruction newInst = new Instruction("PRINT", r1);
           newInst.setComment("print: print contents of reg "+r1+
            " (var "+regTable.lookupRegister(r1)+")");
           $instructions.add(newInst);
        }
        else {
           Instruction newInst = new Instruction("PRINTLN", r1);
           newInst.setComment("print: print contents of reg "+r1+
            " (var "+regTable.lookupRegister(r1)+")");
           $instructions.add(newInst);
        }
     }
   ;

read returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int reg = regTable.newRegister(); }
   : ^(READ readStuff=lvalue[reg]) {
      /*a
         $instructions.addAll(0, $readStuff.instructions);
       
         LinkedList<Register> memAddr = null;
         if(shouldStore) {
            memAddr = $instructions.getLast().getSourceRegisterList();
         }

         Instruction newInst = new Instruction("READ", reg);
      */
         /*newInst.setComment("read: read into address stored in reg "+reg+
          " (var "+regTable.lookupRegister(reg)+")");
         */
         /*a
         $instructions.add(newInst);
         */
         /*
         Read doesn't seem to work when you read more than once in a row.
         - fixed this. 
         */
/*
         if(!shouldStore) {
            // I suspect we need to move from the read register back to the variable
            int lvalRegister  = -1;
            if (regTable.containsId(currentFunction + $readStuff.text))
               lvalRegister = regTable.lookupId(currentFunction + $readStuff.text);
            else
               lvalRegister = regTable.lookupId($readStuff.text);

            newInst = new Instruction("MOV", reg, lvalRegister);
            $instructions.add(newInst);
         } else {
            $instructions.add(new Instruction(
            "STAI", reg, memAddr.removeFirst().getValue(),
            memAddr.removeFirst().getValue()));
            shouldStore = false;
         }
  */
         Instruction newInst = new Instruction("READ", reg);
         $instructions.add(newInst);
         $instructions.addAll($readStuff.instructions);
      }
   ;

delete returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(DELETE exp=expression[r1]) {
        //a $instructions.addAll(0, $exp.instructions);
//        $instructions.add(new Instruction("DEL", r1));
//        $instructions.add(new Instruction("DEL"));
         // instead of free (bus error, dont remember from lecture), just set it to null
         //a Instruction newInst = new Instruction("MOV", regTable.getZeroRegister(), r1);
         //a $instructions.add(newInst);
   }

   ;

ret returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.getOutRegister(); }
   : ^(RETURN (exp=expression[r1])?) {
      //* changed getOutRegister to getReturnRegister <- changed this back.
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

lvalue[int newValueReg] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int structPtr = regTable.newRegister(); }
   : ^(DOT subIloc=subvalue[structPtr] fieldId=ID) {
      shouldStore = true;
      $instructions.addAll(0, $subIloc.instructions);
      int offset = stable.getOffset(currentStruct, $fieldId.text);
       
      Instruction newInst = new Instruction("STAI", 
                                       newValueReg, 
                                       structPtr, 
                                       offset);
      $instructions.add(newInst);
   }
   | id=ID {
        int varReg = -1;
        if (regTable.containsId(currentFunction + $id.text))
           varReg = regTable.lookupId(currentFunction + $id.text);
        else varReg = regTable.lookupId($id.text);
        
        //Instruction newInst = new Instruction("MOV", varReg, resultReg);
        //newInst.setComment("lvalue id: move reg "+varReg+" (var "+$id.text+") to reg "+resultReg);
        Instruction newInst = new Instruction("MOV", newValueReg, varReg);
        $instructions.add(newInst);
     }
   ;

subvalue[int structPtr] returns [LinkedList<Instruction> instructions =
 new LinkedList<Instruction>()]
@init { int reg = regTable.newRegister(); }
   : ^(DOT sub=subvalue[structPtr] id=ID) {
      $instructions.addAll(0, $sub.instructions);

      int offset = stable.getOffset(currentStruct, $id.text);
     
      $instructions.add(new Instruction("LOADAI",
                              structPtr,
                              offset,
                              structPtr));
      
      currentStruct = stable.getType(currentStruct, $id.text);
      currentStruct = currentStruct.substring(7);
     }
   | id=ID {
      // This is the base structure variable
      currentStruct = funtable.getType(currentFunction, $id.text);
      // Hack: take 'struct' off the front to get the raw type.
      // struct and one space = 7 chars
      currentStruct = currentStruct.substring(7);
      
      /*
      Instruction newInst = new Instruction("LOADAI",
                                 regTable.lookupId(currentFunction+$id.text),
                                 regTable.getZeroRegister(),
                                 structPtr);
      */
      int srcRegister = -1;
      if(regTable.containsId(currentFunction + $id.text))
         srcRegister = regTable.lookupId(currentFunction + $id.text);
      else
         srcRegister = regTable.lookupId($id.text);

      Instruction newInst = new Instruction("MOV", srcRegister, structPtr); 
      $instructions.add(newInst);
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
        /*newInst.setComment("expression: reg " + lexprReg + 
         " (var "+regTable.lookupRegister(lexprReg)+")"+
         " " + $op.text +
         " " + rexprReg + " in reg " + resultReg +
         " (var "+regTable.lookupRegister(lexprReg)+")")*/;
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

        $instructions.add(new Instruction(
         "LOADI", 1, regTable.getImmRegister()));
        //clear junk in resultReg; resultReg must return 0 or 1
        $instructions.add(new Instruction(
         "MOV", regTable.getZeroRegister(), resultReg));
        
        // Do the comparison, set cc
        Instruction newInst = new Instruction(
         "COMP", lexprReg, rexprReg, regTable.getCCRegister());
        /*newInst.setComment("expression: compare: reg " + lexprReg +
         " (var " + regTable.lookupRegister(lexprReg) + ") to " + rexprReg + 
         " (var " + regTable.lookupRegister(rexprReg) + "), store in cc-reg");*/
        $instructions.add(newInst);

        String movOp = $op.text.equals("==") ? "EQ" :
           $op.text.equals("<") ? "LT" :
           $op.text.equals(">") ? "GT" :
           $op.text.equals("!=") ? "NE" :
           $op.text.equals("<=") ? "LE" :
           $op.text.equals(">=") ? "GE" : null;
        //conditional move
        $instructions.add(new Instruction(
         "MOV" + movOp, regTable.getCCRegister(), regTable.getImmRegister(),
         resultReg));
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

   | ^(INVOKE id=ID args=arguments) {
        $instructions.addAll(0, args);
        Instruction newInst = new Instruction("CALL", $id.text);
        newInst.setComment("invocation: call function " + $id.text);
        $instructions.add(newInst);
        //move the return value to the result reg so that the value may get used
        $instructions.add(new Instruction("MOV", regTable.getReturnRegister(),
         resultReg));
     }
   
   | ^(DOT expr=expression[resultReg] fieldId=ID) {
         // Current struct should be set in ID, below
         int offset = stable.getOffset(currentStruct, $fieldId.text);
         //currentStruct = stable.getType(currentStruct, $fieldId.text);
        
         $instructions.addAll(0, $expr.instructions);
        
         Instruction newInst = new Instruction("LOADAI", 
                                                resultReg, 
                                                offset, 
                                                resultReg);
         $instructions.add(newInst);
        //System.out.println("looking for: "+currentFunction+$id.text); 
         if(null != $id.text) {
            currentStruct = funtable.getType(currentFunction, $id.text);
            currentStruct = currentStruct.substring(7);
         }
     }

   | id=ID {
         //may be a problem with recursion?
        
        // ***
        //int srcRegister = regTable.lookupId(currentFunction + $id.text);
        //if(-1 == srcRegister) {
        //   srcRegister = regTable.lookupId($id.text);
        //}
         int srcRegister = -1;
         if (regTable.containsId(currentFunction + $id.text))
            srcRegister = regTable.lookupId(currentFunction + $id.text);
         else
            srcRegister = regTable.lookupId($id.text);

        Instruction newInst = new Instruction("MOV", srcRegister, resultReg);
        /*newInst.setComment("id: move reg "+srcRegister+" (var "+regTable.lookupRegister(srcRegister)+
         ") to reg "+resultReg);
         */
        $instructions.add(newInst);
        
// added this balogna to make my life easier
try { //
         currentStruct = funtable.getType(currentFunction, $id.text);
         currentStruct = currentStruct.substring(7);
} catch(Exception e) {//
   currentStruct = null;
}//
    }

   | i=INTEGER {
//        int immRegister = regTable.newRegister();
        Instruction newInst = new Instruction("LOADI",
         Integer.parseInt($i.text), resultReg);
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
        Instruction newInst = new Instruction("MOV", regTable.getZeroRegister(), resultReg);
        newInst.setComment("bool: reg "+resultReg+" gets false");
        $instructions.add(newInst);
     }

   | ^(NEW id=ID) {
        /*
        $instructions.add(new Instruction(
         "LOADI", stable.getNumFields($id.text) * 4,
         regTable.getReturnRegister()));
        $instructions.add(new Instruction(
         "NEW"));
        $instructions.add(new Instruction(
         "MOV", regTable.getReturnRegister(), resultReg));
        */
         $instructions.add(new Instruction("NEW", stable.getSize($id.text), regTable.getReturnRegister()));
         $instructions.add(new Instruction("MOV", regTable.getReturnRegister(), resultReg));
         /* make the fields null */
         for(int offset=0; offset<stable.getSize($id.text); offset+=4) { // increase by INT size
            instructions.add(new Instruction("STAI",
                                                regTable.getZeroRegister(),
                                                resultReg,
                                                offset));
            }
     }

   | NULL {
        Instruction newInst = new Instruction("MOV", regTable.getZeroRegister(), resultReg);
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
       int outReg = 0; }
   : ^(ARGS (exprInstr=expression[srcReg] {
        Instruction newInst;
        $instructions.addAll($exprInstr.instructions);

        int tmpArgReg = regTable.getArgRegister(outReg++);
        if (tmpArgReg != -1) {
           newInst = new Instruction("STOUT", srcReg, tmpArgReg);
           newInst.setComment("argument: store out param from reg " + srcReg +
            "to register outReg " + outReg);
           $instructions.add(newInst);
        }
        //else: must spill arguments
     })+)
   | ARGS
   ;
