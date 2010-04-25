//make certain structuress global, then propagate changes
tree grammar EvilAST;

options {
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

@members{
   RegTable regTable = new RegTable();
}

program
   : ^(PROGRAM types declarations[symtable] functions)
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
   : list_id+
   ;
   
list_id
   : ID
   ;

functions
   : ^(FUNCS function*)
   ;

function
   : ^(FUN id=ID {
        //for CFG
        entry = new Block();
        exit = new Block();
        head = new Block()
     }
     parameters[locals]

     ^(RETTYPE retType=return_type) {
        symtable.insertSymbol($id.text, $retType.t);
     }

     declarations[locals] {
        symtable.insertSymbol($id.text, retType);
        funTable.addFunction($id.text, locals);
        curFun = $id.text;
     }
     //for CFG
     head = statement[locals, head, exit]
     entry.addNext(head);)
   ;

parameters [SymTable subtable]
   : ^(PARAMS decl[subtable]*)
   ;

return_type returns [String t = null]
   : retType=type { $t = $retType.t; }
   | VOID { $t = SymTable.voidType(); }
   ;

statement[SymTable locals, Block head, Block exit] returns [Block top = null]
//@init{ System.out.println("statement on line " + getLine()); }
   : ^(BLOCK ^(STMTS { $top = head; }
     ({ end = new Block(); } head = statement[locals, head, end] { head = end; })* {
        end.addNext(exit);
     })

   | ^(STMTS { $top = head; }
     ({ end = new Block(); } head = statement[locals, head, end] { head = end; })* {
        end.addNext(exit);
     })

   | iloc=assignment[locals] {
        /*head.addILoc(iloc);*/
        head.addNext(exit);
        $top = head;
     }

   | iloc=print[locals] {
        /*head.addILoc(iloc);*/
        head.addNext(exit);
        $top = head;
     }

   | iloc=read[locals] {
        /*head.addILoc(iloc);*/
        head.addNext(exit);
        $top = head
     }

   | ^(IF iloc=expression[locals] {
        /*head.addILoc(iloc);*/
        end = new Block();
        end.next = exit;
        thenHead = new Block();
        elseHead = new Block();
     }
     thenHead = statement[locals, thenHead, end] 
     elseHead = statement[locals, elseHead, end] {
        head.addNext(thenHead);
        head.addNext(elseHead);
        $top = head;
     })

   | ^(WHILE iloc=expression[locals] {
        /*head.addILoc(iloc);*/
        end = new Block();
        end.addNext(exit);
        body = new Block();
     }
     body = statement[locals, body, head] {
        head.addNext(body);
        head.addNext(end);
        $top = head;
     })

   | iloc=delete[locals] {
        /*head.addILoc(iloc);*/
        head.addNext(exit);
        $top = head;
     }

   | iloc=ret[locals] {
        /*head.addILoc(iloc);*/
        head.addNext(exit);
        $top = head;
     }

   | iloc=invocation[locals] {
        /*head.addILoc(iloc);*/
        head.addNext(exit);
        $top = head;
     }
   ;

assignment[SymTable locals] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
@init { int r = regTable.newRegister(); }
   : ^(ASSIGN exp=expression[r] lval=lvalue[locals])
   	{	// Lookup right register
   		// Store
   	}
   ;

print[SymTable locals]  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(PRINT exp=expression[locals] (ENDL)?)

   ;

read[SymTable locals] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(READ exp=lvalue[locals])

   ;

delete[SymTable locals] returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(DELETE exp=expression[locals])

   ;

ret[SymTable locals]  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(RETURN (exp=expression[locals])?)

   ;

invocation[SymTable locals]  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
   : ^(INVOKE id=ID args=arguments[locals])
   	//{ $node = new InstructionNode(Instruction.Operation.JUMPI, $id, $exp); }
   ;

lvalue[SymTable locals]  returns [LinkedList<Instruction> instructions = new LinkedList<Instruction>()]
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
   		lexpr=expression[r1] 
   		rexpr=expression[r2])
   		{ 	$instructions.addAll(0, $lexpr.instructions);
   			$instructions.addAll(0, $rexpr.instructions);
   			$instructions.add(new Instruction(Instruction.getOperator($op), r1, r2, resultReg)); }
   | ^(NEG expr=expression[r1])
   		// Is this just a negative number?
   		{ 	$instructions.addAll(0, $expr.instructions);
   			$instructions.add(new Instruction(Instruction.Operator.LOADI, r2, -1);
   			$instructions.add(new Instruction(Instruction.Operator.MULT, r1, r2, resultReg); }
   | ^(NOT expr=expression[r1])
			// Something
   | ^(DOT expr=expression[r1] fieldId=ID)
	   // Load
	   // Store
   | ^(INVOKE id=ID args=arguments[locals])
		// Jump
   | id=ID
		// Load into resultReg
   | i=INTEGER
   		
   | TRUE
   		{ $instructions.add(new Instruction(Instructions.Operator.LOADI, resultReg, 1)); }
   | FALSE
   		{ $instructions.add(new Instruction(Instructions.Operator.LOADI, resultReg, 0)); }
   | ^(NEW id=ID)
   	// Allocate
   | NULL
   ;

arguments[SymTable locals]
   : arg_list[locals]
   ;

arg_list[SymTable locals]
   : ^(ARGS expression[locals]+)
   | ARGS
   ;
