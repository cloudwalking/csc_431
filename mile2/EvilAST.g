tree grammar EvilAST;

options {
  backtrack = true;
  output = AST;
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

@members {
  protected StructTable stable = new StructTable();
}

program [SymTable symtable, FunTable funtable]
   : ^(PROGRAM types[symtable] declarations[symtable] functions[symtable, funtable])
   ;
  
types [SymTable symtable]
  : ^(TYPES type_sub[symtable])
  |	TYPES
  ;

type_sub [SymTable symtable]
	: type_declaration[symtable] type_sub[symtable]
	| 
	;
  
type_declaration [SymTable symtable]
	: ^(STRUCT id=ID
			{ symtable.insertSymbol($id.text, SymTable.structType($id.text)); }
			structSymTable=nested_decl)
		{ stable.addStruct($id.text, structSymTable); }
  ;
  
nested_decl returns [SymTable subtable = new SymTable()]
  : decl[subtable]+
  ;

decl [SymTable subtable]
	:	^(DECL ^(TYPE t=type) id=ID)
		{ subtable.insertSymbol($id.text, t); }
	;

type returns [String t = null]
  :  INT { $t = SymTable.intType(); }
  |  BOOL { $t = SymTable.boolType(); }
  |  ^(STRUCT id=ID)
     {
        if (!stable.isDefined($id.text))
        {
          System.err.println("line " + $id.line + ": undefined struct type '" + $id + "'");
        }
        $t = SymTable.structType($id.text);
     }
  ;
  
declarations [SymTable symtable]
	: ^(DECLS declaration[symtable]*)
	;

declaration [SymTable symtable]
	:	^(DECLLIST ^(TYPE t=type) id_list[symtable, t])
	;

id_list [SymTable symtable, String t]
	:	list_id[symtable, t]+
	;
	
list_id [SymTable symtable, String t]
	: id=ID
		{ if (!$symtable.isDefined($id.text))
			{
				symtable.insertSymbol($id.text, $t);
			}
		  else
			{
				System.err.println("line " + $id.line + ": already declared '" + $id + "'");
			}
		}
	;

functions [SymTable symtable, FunTable funtable]
	: ^(FUNCS function*)
	;
function
	:// ^(FUN<FunctionTree> id=ID param=parameters ^(RETTYPE retType=return_type) funDecls=declarations funBody=statement_list)
	;
/*
parameters
	: ^(PARAMS decl*)
	;

return_type
	: type
	| VOID
	;

statement
	: block
	| assignment
	| print
	| read
	| conditional
	| loop
	| delete
	| ret
	| invocation
	;

block
	: ^(BLOCK statement_list)
	;

statement_list
	: ^(STMTS statement*)
	;

assignment[SymTable stable]
	: ^(ASSIGN expr=expression lval=lvalue)
		{
			if (stable.isDefined($lval)) {
				System.err.println("lvalue of assignment undefined");
			}
			//check that expression is of same type as lvalue
		}
	;

print
	: PRINT^ expression (ENDL)?
	;

read
	: READ^ lvalue
	;

conditional
	: IF^ expression block (block)?
	;

loop
	: ^(WHILE expr=expression b=block expr2=expression)
	;

delete
	: DELETE^ expression
	;

ret
	: RETURN^ (expression)?
	;

invocation
	: ^(INVOKE id=ID args=arguments)
	;

lvalue
	: ID (DOT<DottedTree>^ ID)*
	;

expression
	: boolterm ((AND^ | OR^) boolterm)*
	;

boolterm
	: simple ((EQ^ | LT^ | GT^ | NE^ | LE^ | GE^) simple)?
	;

simple
	: term ((PLUS^ | MINUS^) term)*
	;

term
	: unary ((TIMES^ | DIVIDE^) unary)*
	;

unary
	: odd_not
	| odd_neg
	| selector
	;

odd_not
	: even_not
	| ^(NOT sel=selector)
	;

even_not
	: odd_not
	| selector
	;

odd_neg
	: even_neg
	| ^(NEG sel=selector)
	;

even_neg
	: odd_neg
	| selector
	;

selector
	: factor (DOT<DottedTree>^ ID)*
	;

factor
	: expression
	| ^(INVOKE id=ID args=arguments)
	| ID
	| INTEGER
	| TRUE
	| FALSE
	| NEW^ ID
	| NULL
	;

arguments
	: arg_list
	;

arg_list
	: ^(ARGS expression+)
	| ARGS
	;
*/