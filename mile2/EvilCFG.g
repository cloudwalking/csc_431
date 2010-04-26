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
}

program
   : ^(PROGRAM types top_instrs=declarations functions[top_instrs])
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

declarations returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(DECLS (instr=declaration)*)
   {	$instructions.addAll(instr); }
   ;

declaration returns [LinkedList<Instruction> instructions = null]
   : ^(DECLLIST ^(TYPE type) inst=id_list)
   {	$instructions = $inst.instructions;}
   ;

id_list returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : (register=list_id)+
	   {	$instructions.add(new Instruction(Instruction.Operator.NEW, register)); }
   ;
   
list_id returns [int reg]
   : id=ID
   {	$reg = regTable.lookupId($id.text); }
   ;

functions[LinkedList<Instruction> top_instrs]
@init { LinkedList<Instruction> blank_instrs = new LinkedList<Instruction>(); }
   : ^(FUNCS function[top_instrs] function[blank_instrs]*)
   ;

function[LinkedList<Instruction> top_instrs]
//@init { RegTable localRegisters = new RegTable(); }
   : ^(FUN id=ID {
        //for CFG
        Block entry = new Block();
        Block exit = new Block();
        Block head = new Block();
        head.addILoc(top_instrs); // Globals
	     }
	     parameters
	     ^(RETTYPE return_type)
	     declarations
	     //for CFG
	     head = statement[head, exit]
	     { entry.addNext($head.top); }
     )
   ;

parameters
   : ^(PARAMS decl*)
   ;

return_type 
   : type
   | VOID
   ;

statement[Block head, Block exit] returns [Block top = null]
//@init{ System.out.println("statement on line " + getLine()); }
   :^(BLOCK ^(STMTS {
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
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=print {
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=read {
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
		}

	// This register needs to be allocated? Or we dont care about it?
   | ^(IF iloc=expression[0] {
        head.addILoc($iloc.instructions);
        end = new Block();
        end.next = exit;
        thenHead = new Block();
        elseHead = new Block();
     }
     thenHead = statement[thenHead, end] 
     elseHead = statement[elseHead, end] {
        head.addNext(thenHead);
        head.addNext(elseHead);
        $top = head;
     })

	// This register needs to be allocated? Or we dont care about it?
   | ^(WHILE iloc=expression[0] {
        head.addILoc($iloc.instructions);
        end = new Block();
        end.addNext(exit);
        body = new Block();
     }
     body = statement[body, head] {
        head.addNext(body);
        head.addNext(end);
        $top = head;
     })

   | iloc=delete {
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=ret {
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }

   | iloc=invocation {
        head.addILoc($iloc.instructions);
        head.addNext(exit);
        $top = head;
     }
   ;

assignment returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(ASSIGN exp=expression[r1] register=lvalue)
   	{	//$instructions.addAll(0, $lval.instructions);
   		$instructions.addAll(0, $exp.instructions);
   		$instructions.add(new Instruction(Instruction.Operation.STOREAI, r1, $register.register, 0));
   	}
   ;

print returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(PRINT exp=expression[r1] (ENDL)?)
		{ 	$instructions.addAll(0, $exp.instructions);
			$instructions.add(new Instruction(Instruction.Operation.PRINT, r1)); }
   ;

read returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(READ register=lvalue)
		{ 	$instructions.addAll(0, $exp.instructions);
			$instructions.add(new Instruction(Instruction.Operation.READ, register)); }
   ;

delete returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.newRegister(); }
   : ^(DELETE exp=expression[r1])
		{ 	$instructions.addAll(0, $exp.instructions);
			$instructions.add(new Instruction(Instruction.Operation.DEL, r1)); }
   ;

ret returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r1 = regTable.getReturnRegister(); }
   : ^(RETURN (exp=expression[r1])?)
		{ 	$instructions.addAll(0, $exp.instructions);
			$instructions.add(new Instruction(Instruction.Operation.RET)); }
   ;

invocation  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(INVOKE id=ID args=arguments)
   	{	// Store the args in arg registers
   		$instructions.add(new Instruction(Instruction.Operation.JUMPI, $id.text)); }
   ;

lvalue returns [int register]
   : ^(DOT structId=subvalue fieldId=ID)
   | id=ID
   	{	$register = regTable.lookupId($id.text); }
   ;

subvalue returns [int register]
   : ^(DOT structId=subvalue fieldId=ID)
   | id=ID
		{	$register = regTable.lookupId($id.text); }
   ;

// Returns a list of it's instructions
expression [int resultReg] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(op=(AND | OR | PLUS | MINUS | TIMES | DIVIDE)
   		{ int r1 = regTable.newRegister(), r2 = regTable.newRegister(); }
   		lexpr=expression[r1] 
   		rexpr=expression[r2])
   		{ 	$instructions.addAll(0, $lexpr.instructions);
   			$instructions.addAll(0, $rexpr.instructions);
   			$instructions.add(new Instruction(Instruction.getOperator($op.text), r1, r2, resultReg)); }
   | ^((EQ | LT | GT | NE | LE | GE)
   		{ int r1 = regTable.newRegister(), r2 = regTable.newRegister(); }
   		lexpr=expression[r1] 
   		rexpr=expression[r2])
   		{	$instructions.addAll(0);}
   | ^(NEG { int r1 = regTable.newRegister(); }  expr=expression[r1])
   		{ int r2 = regTable.newRegister(); }
   		// Is this just a negative number?
   		{ 	$instructions.addAll(0, $expr.instructions);
   			$instructions.add(new Instruction(Instruction.Operator.LOADI, r2, -1));
   			$instructions.add(new Instruction(Instruction.Operator.MULT, r1, r2, resultReg)); }
   | ^(NOT { int r1 = regTable.newRegister(); } expr=expression[r1])
			{ 	$instructions.add(new Instruction(Instruction.Operator.XORI, r1, 1, resultReg)); }
   | ^(DOT { int r1 = regTable.newRegister(); } expr=expression[r1] fieldId=ID)
	   // Load
	   // Store
   | ^(INVOKE id=ID args=arguments)
		// Jump
   | id=ID
		{ 	$instructions.add(new Instruction(Instruction.Operator.LOADAI, regTable.lookupId($id.text), 0, resultReg)); }
   | i=INTEGER
   	{ $instructions.add(new Instruction(Instruction.Operator.LOADI, resultReg, $i.text)); }
   | TRUE {
        $instructions.add(new Instruction(
         Instruction.Operator.LOADI, resultReg, 1));
     }
   | FALSE {
        $instructions.add(new Instruction(
         Instruction.Operator.LOADI, resultReg, 0));
     }
   | ^(NEW id=ID) {
        $instructions.add(new Instruction(
         Instruction.Operator.NEW, resultReg, $id.text));
     }
   | NULL
   	// Something
   ;

arguments
   : arg_list
   ;

arg_list
@init { int r1 = regTable.getReturnRegister(); }
   : ^(ARGS expression[r1]+)
   | ARGS
   ;
