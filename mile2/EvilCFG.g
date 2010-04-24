//make certain structuress global, then propagate changes
tree grammar EvilAST;

options {
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

@members{
   StructTable structTable = new StructTable();
   SymTable symtable = new SymTable();
   FunTable funTable = new FunTable();
   String curFun;
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
   : ^(STRUCT id=ID {
        structTable.addStruct($id.text);
     }
     structSymTable=nested_decl) {
        structTable.updateStruct($id.text, $structSymTable.subtable);
     }
   ;
  
nested_decl returns [SymTable subtable = new SymTable()]
   : decl[subtable]+
   ;

decl [SymTable subtable]
   : ^(DECL ^(TYPE t=type) id=ID) { subtable.insertSymbol($id.text, t); }
   ;

type returns [String t = null]
   :  INT { $t = SymTable.intType(); }
   |  BOOL { $t = SymTable.boolType(); }
   |  ^(STRUCT id=ID) {
        if (!structTable.isDefined($id.text)) {
          System.err.println("line " + $id.line +
           ": undefined struct type '" + $id + "'");
        }
        $t = SymTable.structType($id.text);
     }
   ;

declarations [SymTable locals]
   : ^(DECLS declaration[locals]*)
   ;

declaration [SymTable local]
   : ^(DECLLIST ^(TYPE t=type) id_list[local, t])
   ;

id_list [SymTable local, String t]
   : list_id[local, t]+
   ;
   
list_id [SymTable local, String t]
   : id=ID {
        if (!$local.isDefined($id.text)) {
           local.insertSymbol($id.text, $t);
        }
        else {
           System.err.println("line " + $id.line +
            ": already declared '" + $id + "'");
        }
     }
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
     thenHead = statement[locals, thenHead, end] elseHead = statement[locals, elseHead, end] {
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
   : ^(ASSIGN exprType=expression[locals] lvalType=lvalue[locals])
   ;

print[SymTable locals]
   : ^(PRINT extype=expression[locals] (ENDL)?)
   ;

read[SymTable locals]
   : ^(READ lvalType=lvalue[locals])
   ;

delete[SymTable locals]
   : ^(DELETE expression[locals])
   ;

ret[SymTable locals] returns [boolean hasReturn = false]
   : ^(RETURN (retType=expression[locals])?)
   ;

invocation[SymTable locals]
   : ^(INVOKE id=ID args=arguments[locals])
   ;

lvalue[SymTable locals] returns [String t = null]
   : ^(DOT structId=subvalue fieldId=ID)
   | valId=ID
   ;

subvalue returns [String t = null]
   : ^(DOT structId=subvalue fieldId=ID)
   | id=ID
   ;

expression [SymTable locals] returns [String t = null]
   : ^(AND lexpr=expression[locals] rexpr=expression[locals])
   | ^(OR lexpr=expression[locals] rexpr=expression[locals])

   | ^((EQ | LT | GT | NE | LE | GE) lexpr=expression[locals]
      rexpr=expression[locals])
   | ^((PLUS | MINUS) lexpr=expression[locals] rexpr=expression[locals])
   | ^((TIMES | DIVIDE) lexpr=expression[locals] rexpr=expression[locals])

   | ^(NEG extype=expression[locals])
   | ^(NOT expression[locals])

   | ^(DOT structType=expression[locals] fieldId=ID)
   | ^(INVOKE id=ID args=arguments[locals])

   | id=ID
   | INTEGER
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
