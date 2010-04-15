tree grammar EvilAST;

options {
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

program [StructTable structTable, SymTable symtable, FunTable funtable]
   : ^(PROGRAM types[structTable, symtable] declarations[symtable]
      functions[structTable, symtable, funtable])
   ;
  
types [StructTable structTable, SymTable symtable]
  : ^(TYPES type_sub[structTable, symtable])
  |   TYPES
  ;

type_sub [StructTable structTable, SymTable symtable]
   : type_declaration[structTable, symtable] type_sub[structTable, symtable]
   | 
   ;
  
type_declaration [StructTable structTable, SymTable symtable]
   : ^(STRUCT id=ID
        { structTable.addStruct($id.text); }
     structSymTable=nested_decl[symtable])
        { structTable.updateStruct($id.text, $structSymTable.subtable); }
  ;
  
nested_decl [SymTable symtable] returns [SymTable subtable = new SymTable()]
  : decl[symtable, subtable]+
  ;

decl [SymTable symtable, SymTable subtable]
   : ^(DECL ^(TYPE t=type[symtable]) id=ID)
     { subtable.insertSymbol($id.text, t); }
   ;

type [SymTable symtable] returns [String t = null]
  :  INT { $t = SymTable.intType(); }
  |  BOOL { $t = SymTable.boolType(); }
  |  ^(STRUCT id=ID)
     {
        if (!symtable.isDefined($id.text))
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
   :   ^(DECLLIST ^(TYPE t=type[symtable]) id_list[symtable, t])
   ;

id_list [SymTable symtable, String t]
   :   list_id[symtable, t]+
   ;
   
list_id [SymTable symtable, String t]
   : id=ID
      {  if (!$symtable.isDefined($id.text))
         {
            symtable.insertSymbol($id.text, $t);
         }
         else
         {
            System.err.println("line " + $id.line + ": already declared '" + $id + "'");
         }
      }
   ;

//figure out stuff with funtable, to know where they are instantiated
//and what they will map to
functions [StructTable structTable, SymTable symtable, FunTable funtable]
   : ^(FUNCS function[structTable, symtable, funtable]*)
   ;

function [StructTable structTable, SymTable symtable, FunTable funtable]
   : ^(FUN id=ID
     {
        if (isDefined($id.text))
        {
           System.err.println("line " + $id.line + ": symbol '" + $id + "' already defined");
        }
        else
        {
           SymTable locals = new SymTable();
        }
     }
      parameters[symtable, locals] ^(RETTYPE retType=return_type[symtable])
      locals=declarations[locals]
      {
         symtable.insertSymbol($id.text, retType);
      }
      statement[structTable])
   ;

parameters [SymTable symtable, SymTable subtable]
   : ^(PARAMS decl[symtable, subtable]*)
   ;

return_type [SymTable symtable] returns [String t = null]
   : type[symtable]
   | VOID
   ;

statement[StructTable structTable]
   : ^(BLOCK ^(STMTS statement[structTable]*))
   | assignment[structTable]
   | print
   | read
   | ^(IF expression statement[structTable] (statement[structTable])?)
   | ^(WHILE expr=expression b=statement[structTable] expr2=expression)
   | delete
   | ret
   | invocation
   ;

assignment[StructTable structTable]
   : ^(ASSIGN expr=expression lval=lvalue)
   ;

print
   : ^(PRINT expression (ENDL)?)
   ;

read
   : ^(READ lvalue)
   ;

delete
   : ^(DELETE expression)
   ;

ret
   : ^(RETURN (expression)?)
   ;

invocation
   : ^(INVOKE id=ID args=arguments)
   ;

lvalue[SymTable symtable]
   : ^(DOT structId=ID
     {
        if(symtable.isDefined($structId.text)
        {
            //want to pass symbolTable
        }
        else if(!structTable.isDefined($structId.text)
        {
            //error
        }
     }
      lvalue[structTable.getField($structId)])
   | valId=ID
   ;

expression
   : ^(AND lexpr=expression rexpr=expression)
   | ^(OR lexpr=expression rexpr=expression)

   | ^((EQ | LT | GT | NE | LE | GE) rexpr=expression lexpr=expression)
   | ^((PLUS | MINUS) rexpr=expression lexpr=expression)
   | ^((TIMES | DIVIDE) rexpr=expression lexpr=expression)

   | ^(NEG expression)
   | ^(NOT expression)
   | ^(DOT expression ID)

   | ^(INVOKE id=ID args=arguments)
   | ID
   | INTEGER
   | TRUE
   | FALSE
   | ^(NEW ID)
   | NULL
   ;
arguments
   : arg_list
   ;

arg_list
   : ^(ARGS expression+)
   | ARGS
   ;
