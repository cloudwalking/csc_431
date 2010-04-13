tree grammar EvilAST;

options {
  backtrack = true;
  output = AST;
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

program
   : ^(PROGRAM t=types d=declarations f=functions)
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
   : ^(STRUCT id=ID nested_decl)
   ;
  
nested_decl
   : decl+
   ;

decl
   : ^(DECL ^(TYPE t=type) id=ID)
   ;

type returns [String t = null]
   : INT { $t = SymTable.intType(); }
   | BOOL { $t = SymTable.boolType(); }
   | ^(STRUCT id=ID)
     {
        /*if (!$envChain.isDefined($id.text))
        {
           System.err.println("line " + $id.line + ": undefined struct type '" + $id + "'");
        }*/
        $t = SymTable.structType($id.text);
     }
   ;
  
declarations
   : ^(DECLS declaration*)
   ;

declaration
   : ^(DECLLIST ^(TYPE t=type) id_list)
   ;

id_list
   : ^(id=ID id_list+)
   ;
   
functions
   : ^(FUNCS function*)
   ;

function
   : ^(FUN<FunctionTree> id=ID param=parameters
      ^(RETTYPE retType=return_type) funDecls=declarations funBody=statement_list)
     /*{
         envChain.insertGlobal($id.text, retType);
         envChain.insertSymbol(
     }*/
   ;

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

assignment
   : ^(ASSIGN expr=expression lval=lvalue)
     {/*
        if (envChain.isDefined(lval)) {
           System.err.println("lvalue of assignment undefined");
        }*/
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
   : ^((AND^ | OR^) lexpr=expression rexpr=expression)
   | ^((EQ^ | LT^ | GT^ | NE^ | LE^ | GE^) lexpr=expression rexpr=expression)
   | ^((PLUS^ | MINUS^) lexpr=expression rexpr=expression)
   | ^((TIMES^ | DIVIDE^) lexpr=expression rexpr=expression)
   | ^(DOT<DottedTree>^ ID) expression 
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
