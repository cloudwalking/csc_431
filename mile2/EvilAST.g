tree grammar EvilAST;

options {
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

program [StructTable structTable, SymTable symtable, FunTable funtable]
   : ^(PROGRAM types[structTable, symtable] declarations[symtable, structTable]
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
     structSymTable=nested_decl[structTable])
        { structTable.updateStruct($id.text, $structSymTable.subtable); }
  ;
  
nested_decl [StructTable stable] returns [SymTable subtable = new SymTable()]
  : decl[subtable, stable]+
  ;

decl [SymTable subtable, StructTable stable]
   : ^(DECL ^(TYPE t=type[stable]) id=ID)
     { subtable.insertSymbol($id.text, t); }
   ;

type [StructTable structTable] returns [String t = null]
  :  INT { $t = SymTable.intType(); }
  |  BOOL { $t = SymTable.boolType(); }
  |  ^(STRUCT id=ID)
     {
        if (!structTable.isDefined($id.text))
        {
          System.err.println("line " + $id.line + ": undefined struct type '" + $id + "'");
        }
        $t = SymTable.structType($id.text);
     }
  ;

declarations [SymTable symtable, StructTable structTable]
   : ^(DECLS declaration[symtable, structTable]*)
   ;

declaration [SymTable symtable, StructTable structTable]
   :   ^(DECLLIST ^(TYPE t=type[structTable]) id_list[symtable, t])
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
        if (symtable.isDefined($id.text))
        {
           System.err.println("line " + $id.line + ": symbol '" + $id + "' already defined");
        }
        SymTable locals = new SymTable();
     }
      parameters[locals, structTable]
      ^(RETTYPE retType=return_type[structTable])
      {
         symtable.insertSymbol($id.text, $retType.t);
      }
      declarations[locals, structTable]
      {
         symtable.insertSymbol($id.text, retType);
         funtable.addFunction($id.text, locals);
      }
      statement[symtable, structTable])
   ;

parameters [SymTable subtable, StructTable structTable]
   : ^(PARAMS decl[subtable, structTable]*)
   ;

return_type [StructTable structTable] returns [String t = null]
   : retType=type[structTable]
     {
        $t = $retType.t;
     }
   | VOID
     {
        $t = SymTable.voidType();
     }
   ;

statement[SymTable symtable, StructTable structTable]
//@init{ System.out.println("statement"); }
   : ^(BLOCK ^(STMTS statement[symtable, structTable]*))
   | ^(STMTS statement[symtable, structTable]*)
   | assignment[symtable, structTable]
   | print[symtable]
   | read[symtable, structTable]
   | ^(IF expression statement[symtable, structTable] (statement[symtable, structTable])?)
   | ^(WHILE expr=expression b=statement[symtable, structTable] expr2=expression)
   | delete
   | ret
   | invocation
   ;

assignment[SymTable symtable, StructTable structTable]
@init{ System.out.println("assignment"); }
   : ^(ASSIGN exprType=expression lvalType=lvalue[symtable, structTable])
     {
        if(!$lvalType.t.equals(exprType))
        {
           System.err.println("Type Mismatch in assignment\n");
        }
     }
   ;

print [SymTable symtable]
   : ^(PRINT exprType=expression (ENDL)?)
    /* {
        if (!exprType.equals(SymTable.intType()))
        {
           System.err.println("Cannot print non-integers");
        }
     }*/
   ;

read [SymTable symtable, StructTable structTable]
   : ^(READ lvalType=lvalue[symtable, structTable])
     {
        //check lvalType = int
     }
   ;

delete
   : ^(DELETE expression)
   ;

ret
@init{ System.out.println("ret"); }
   : ^(RETURN (expression)?)
   ;

invocation
   : ^(INVOKE id=ID args=arguments)
   ;

lvalue[SymTable symtable, StructTable stable] returns [String t = null]
@init{ System.out.println("lvalue");}
   : ^(DOT structId=ID
      {
         if(!symtable.isDefined($structId.text))
         {
            System.err.println("line " + $structId.line + ": undeclared symbol '" + $structId.text + "'");
         }
         if(!stable.isDefined(symtable.getType($structId.text)))
         {
            System.err.println("line " + $structId.line + ": undefined struct type '" + $structId.text + "'");
         }
         // Ok, this ID looks pretty valid.
      }
      tsub=subvalue[stable, $structId.text])
	{
		$t = $tsub.t;
	}
   | ^(valId=ID
     {
        if(!symtable.isDefined($valId.text))
        {
           System.err.println("line " + $valId.line + ": invalid symbol '" + $valId.text + "'");
        }
        $t = symtable.getType($valId.text);
     })
   ;

subvalue[StructTable stable, String parent] returns [String t = null]
@init{ System.out.println("subvalue"); }
   : ^(DOT structId=ID
     {
        if(!stable.isField($parent, $structId.text))
        {
           System.err.println("line " + $structId.line + ": invalid field '" + $structId.text + "' in struct '" + parent + "'");
        }
     }
     tsub=subvalue[stable, $structId.text])
     {
        $t = $tsub.t;
     }
   | ^(valId=ID
     {
        if(!stable.isField($parent, $valId.text))
        {
           System.err.println("line " + $valId.line + ": invalid field '" + $valId.text + "' in struct '" + parent + "'");
        }
        $t=stable.getType($parent, $valId.text);
     })
   ;

expression returns [String t = null]
//@init{ System.out.println("expression"); }
   : ^(AND lexpr=expression rexpr=expression)
   | ^(OR lexpr=expression rexpr=expression)

   | ^((EQ | LT | GT | NE | LE | GE) lexpr=expression rexpr=expression)
     {
        System.out.println("rexpr type is " + rexpr);
        System.out.println("lexpr type is " + lexpr);
     }
   | ^((PLUS | MINUS) rexpr=expression lexpr=expression)
   | ^((TIMES | DIVIDE) rexpr=expression lexpr=expression)

   | ^(NEG expression)
   | ^(NOT expression)
   | ^(DOT expression ID)

   | ^(INVOKE id=ID args=arguments)
   | id=ID{}
   | INTEGER {System.out.println("found an integer thats type is " + SymTable.intType()); $t=SymTable.intType(); }
   | TRUE { t=SymTable.boolType(); }
   | FALSE { t=SymTable.boolType(); }
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
