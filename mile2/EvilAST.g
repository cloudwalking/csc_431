tree grammar EvilAST;

options {
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

@members {
  private boolean DEBUG = true;
}

program [StructTable structTable, SymTable symtable, FunTable funtable]
   : ^(PROGRAM types[symtable, structTable]
   	declarations[symtable, structTable]
      functions[structTable, symtable, funtable])
   ;
  
types [SymTable symtable, StructTable stable]
  : ^(TYPES type_sub[symtable, stable])
  |   TYPES
  ;

type_sub [SymTable symtable, StructTable stable]
   : type_declaration[symtable, stable] type_sub[symtable, stable]
   | 
   ;
  
type_declaration [SymTable symtable, StructTable stable]
   : ^(STRUCT id=ID
		{
			if(DEBUG) System.out.println("g> adding struct '" + $id.text + "'");
			if(DEBUG) stable.print();
			stable.addStruct($id.text); 
		}
     structSymTable=nested_decl[stable])
        { stable.updateStruct($id.text, $structSymTable.subtable); }
  ;
  
nested_decl [StructTable stable] returns [SymTable subtable = new SymTable()]
  : decl[subtable, stable]+
  ;

decl [SymTable subtable, StructTable stable]
   : ^(DECL ^(TYPE t=type[stable]) id=ID)
     { subtable.insertSymbol($id.text, t); }
   ;

type [StructTable stable] returns [String t = null]
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

declarations [SymTable symtable, StructTable stable]
   : ^(DECLS declaration[symtable, stable]*)
   ;

declaration [SymTable symtable, StructTable stable]
   :   ^(DECLLIST ^(TYPE t=type[stable]) id_list[symtable, t])
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
        if (symtable.isDefined($id.text) || funtable.isDefined($id.text))
        {
           System.err.println("line " + $id.line + ": symbol '" + $id + "' already defined");
        }
        SymTable locals = new SymTable();
     	}
      parameters[locals, structTable] // Adds them to the function's symtable
      ^(RETTYPE retType=return_type[structTable])
      declarations[locals, structTable] // Adds them to the function's symtable
      { symtable.insertSymbol($id.text, retType); }
      statement[symtable, structTable])
   ;

parameters [SymTable subtable, StructTable stable]
   : ^(PARAMS decl[subtable, stable]*)
   ;

return_type [StructTable stable] returns [String t = null]
   : type[stable]
   | VOID
   ;

statement[SymTable symtable, StructTable structTable]
   : ^(BLOCK ^(STMTS statement[symtable, structTable]*))
   | assignment[symtable, structTable]
   | print
   | read[symtable, structTable]
   | ^(IF expression statement[symtable, structTable] (statement[symtable, structTable])?)
   | ^(WHILE expr=expression b=statement[symtable, structTable] expr2=expression)
   | delete
   | ret
   | invocation
   ;

assignment[SymTable symtable, StructTable structTable]
   : ^(ASSIGN exprType=expression lvalType=lvalue[symtable, stable])
     {
        if(!lvalType.equals(exprType))
        {
           System.err.println("Type Mismatch in assignment\n");
        }
     }
   ;

print
   : ^(PRINT expression (ENDL)?)
   ;

read [SymTable symtable, StructTable stable]
   : ^(READ lvalue[symtable, stable])
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

<<<<<<< HEAD:mile2/EvilAST.g
lvalue[SymTable symtable, StructTable stable] returns [String t = null]
=======
lvalue[SymTable symtable, StructTable stable]
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
		subvalue[stable, $structId.text])
	;

subvalue[StructTable stable, String parent]
>>>>>>> reed_431/mile2:mile2/EvilAST.g
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
      t=subvalue[stable, $structId.text])
   | valId=ID
     {
<<<<<<< HEAD:mile2/EvilAST.g
        if(!symtable.isDefined($valId.text))
        {
           System.err.println("line " + $valId.line + ": invalid symbol '" + $valId.text + "'");
        }
        else
=======
        if(!stable.isField($parent, $structId.text))
>>>>>>> reed_431/mile2:mile2/EvilAST.g
        {
<<<<<<< HEAD:mile2/EvilAST.g
           t=symtable.getType($valId.text);
=======
	        System.err.println("line " + $structId.line + ": invalid field '" + $structId.text + "' in struct '" + parent + "'");
>>>>>>> reed_431/mile2:mile2/EvilAST.g
        }
     }
<<<<<<< HEAD:mile2/EvilAST.g
   ;

subvalue[StructTable stable, String parent] returns [String t = null]
   : ^(DOT structId=ID
=======
      subvalue[stable, $structId.text])
   | valId=ID
>>>>>>> reed_431/mile2:mile2/EvilAST.g
     {
<<<<<<< HEAD:mile2/EvilAST.g
        if(!stable.isField($parent, $structId.text))
=======
        if(!stable.isField($parent, $valId.text))
>>>>>>> reed_431/mile2:mile2/EvilAST.g
        {
<<<<<<< HEAD:mile2/EvilAST.g
           System.err.println("line " + $structId.line + ": invalid field '" + $structId.text + "' in struct '" + parent + "'");
=======
	        System.err.println("line " + $valId.line + ": invalid field '" + $valId.text + "' in struct '" + parent + "'");
>>>>>>> reed_431/mile2:mile2/EvilAST.g
        }
     }
<<<<<<< HEAD:mile2/EvilAST.g
     subvalue[stable, $structId.text])
   | valId=ID
     {
        if(!stable.isField($parent, $valId.text))
        {
           System.err.println("line " + $valId.line + ": invalid field '" + $valId.text + "' in struct '" + parent + "'");
        }
        else
        {
           t=symtable.getType($valId.text);
        }
     }
=======
>>>>>>> reed_431/mile2:mile2/EvilAST.g
   ;

expression returns [String t = null]
   : ^(AND lexpr=expression rexpr=expression)
   | ^(OR lexpr=expression rexpr=expression)

   | ^((EQ | LT | GT | NE | LE | GE) rexpr=expression lexpr=expression)
   | ^((PLUS | MINUS) rexpr=expression lexpr=expression)
   | ^((TIMES | DIVIDE) rexpr=expression lexpr=expression)

   | ^(NEG expression)
   | ^(NOT expression)
   | ^(DOT expression ID)

   | ^(INVOKE id=ID args=arguments)
   | id=ID { t=
   | INTEGER { t=SymTable.intType(); }
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
