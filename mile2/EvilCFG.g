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

assignment[SymTable locals]
   : ^(ASSIGN exp=expression[locals] lval=lvalue[locals])
   ;

print[SymTable locals] returns [InstructionNode node = null]
   : ^(PRINT exp=expression[locals] (ENDL)?)
	   { $node = new InstructionNode(Expression.Operator.PRINT, $exp); }
   ;

read[SymTable locals] returns [InstructionNode node = null]
   : ^(READ exp=lvalue[locals])
   	{ $node = new InstructionNode(Expression.Operator.READ, $exp); }
   ;

delete[SymTable locals] returns [InstructionNode node = null]
   : ^(DELETE exp=expression[locals])
   	{ $node = new InstructionNode(Expression.Operator.DEL, $exp); }
   ;

ret[SymTable locals] returns [InstructionNode node = null]
   : ^(RETURN (exp=expression[locals])?)
   	{ $node = new InstructionNode(null, $exp); }
   ;

invocation[SymTable locals] returns [InstructionNode node = null]
   : ^(INVOKE id=ID args=arguments[locals])
   	{ $node = new InstructionNode(Instruction.Operation.JUMPI, $id, $exp); }
   ;

lvalue[SymTable locals] returns [String t = null]
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
   		{ 	$instructions.addAll(0, $lexpr);
   			$instructions.addAll(0, $rexpr);
   			$instructions.add(new Instruction(Instruction.getOperator($op), r1, r2, resultReg)); })
   | ^(op=(TIMES | DIVIDE) 
   		lexpr=expression[r1] 
   		rexpr=expression[r2])
			{ 	$instructions.addAll(0, $lexpr);
   			$instructions.addAll(0, $rexpr);
   			$instructions.add(new Instruction(Instruction.getOperator($op), r1, r2, resultReg)); }
   | ^(NEG $expr=expression[locals])
   		// Is this just a negative number?
   		{ $node = new InstructionNode(Instruction.Operator.MULT, $expr, -1); }
   | ^(NOT expression[locals])
			{ $node = new InstructionNode(/* something */, $lexpr, $rexpr)); }
   | ^(DOT structType=expression[locals] fieldId=ID)
   | ^(INVOKE id=ID args=arguments[locals])

   | id=ID
   	{ $node = new InstructionNode(new Instruction(id)); }
   | i=INTEGER
   	{ $node = new InstructionNode(new Instruction(i)); }
   | TRUE
   | FALSE
   | ^(NEW id=ID)
   | NULL
   ;

arguments[SymTable locals]
   : arg_list[locals]
   ;

arg_list[SymTable locals]
   : ^(ARGS expression[locals]+)
   | ARGS
   ;
