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

//figure out stuff with funtable, to know where they are instantiated
//and what they will map to
functions
   : ^(FUNCS function*)
   ;

function
   : ^(FUN id=ID {
        if (symtable.isDefined($id.text)) {
           System.err.println("line " + $id.line + ": symbol '" + $id + "' already defined");
        }
        //entry = new Block();
        //exit = new Block();
        //entry.next = (head = new Block());
        SymTable locals = new SymTable();
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
     //head = statement[head, exit]
     hasReturn=statement[locals, false]) {
        if (!retType.equals(SymTable.voidType()) && !$hasReturn.retVal) {
           System.err.println("Function '" + curFun +
            "' does not have return statement");
        }
     }
   ;

parameters [SymTable subtable]
   : ^(PARAMS decl[subtable]*)
   ;

return_type returns [String t = null]
   : retType=type { $t = $retType.t; }
   | VOID { $t = SymTable.voidType(); }
   ;

//statement[Block head, Block exit] returns [Block statement = null]
statement[SymTable locals, boolean hasReturn] returns [boolean retVal = false]
//@init{ System.out.println("statement on line " + getLine()); }
   : ^(BLOCK ^(STMTS (r=statement[locals, hasReturn])*)) {
     // { statement = head; }
     //( { end = new Block(); } head = statement[head, end] { head = end; })*
     //{ end.next = exit; }

        $retVal = $r.retVal || $hasReturn;
     }
   | ^(STMTS (r=statement[locals, hasReturn])*) {
     // { statement = head; }
     //( { end = new Block(); } head = statement[head, end] { head = end; })*
     //{ end.next = exit; }
        $retVal = $r.retVal || $hasReturn;
     }
   | assignment[locals] { $retVal = $hasReturn; }
     //iloc=assignment { head.iloc = iloc;head.next = exit;statement=head }
   | print[locals] { $retVal = $hasReturn; }
     //iloc=print { head.iloc = iloc;head.next = exit }
   | read[locals] { $retVal = $hasReturn; }
     //iloc=read { head.iloc = iloc;head.next = exit }
   | ^(IF expression[locals] rthen=statement[locals, hasReturn]
      (relse=statement[locals, hasReturn])?) {
//remember to add the then and else heads to head
     //iloc=expression {head.iloc = iloc;end = new Block(); thenHead = new Block(); elseHead = new Block(); }
     //thenHead = statement[thenHead, end] elseHead = statement[elseHead, end]
     //{ end.next = exit; statement = head; }
        $retVal = (($rthen.retVal && $relse.retVal) || $hasReturn);
     }
   | ^(WHILE expr=expression[locals] r=statement[locals, hasReturn]
      expr2=expression[locals]) {
     //iloc=expression {head.iloc = iloc; end = new Block(); body = new Block();  }
     //body = statement[body, head]
     //{ remember to add the body and end to head's successors; statement = head; }
        $retVal = $r.retVal;
     }
   | delete[locals] { $retVal = $hasReturn; }
     //iloc=delete { head.iloc = iloc;head.next = exit }
   | r2=ret[locals] { $retVal = $r2.hasReturn; }
     //iloc=ret { head.iloc = iloc;head.next = exit }
   | invocation[locals] { $retVal = $hasReturn; }
     //iloc=invocation { head.iloc = iloc;head.next = exit }
   ;

assignment[SymTable locals]
   : ^(ASSIGN exprType=expression[locals] lvalType=lvalue[locals]) {
        if(!lvalType.equals(exprType)) {
           System.err.println("Type Mismatch in assignment: found '" +
            exprType + "' type, expected '" + lvalType + "'");
        }
     }
   ;

print[SymTable locals]
   : ^(PRINT extype=expression[locals] (ENDL)?) {
        if (extype != null && !extype.equals(SymTable.intType())) {
           System.err.println("Cannot print non-integers");
        }
     }
   ;

read[SymTable locals]
   : ^(READ lvalType=lvalue[locals]) {
        if (!lvalType.equals(SymTable.intType())) {
           System.err.println("Invalid read operation: expected 'int'" +
            " type, found '" + lvalType +"'");
        }
     }
   ;

delete[SymTable locals]
   : ^(DELETE expression[locals])
   ;

ret[SymTable locals] returns [boolean hasReturn = false]
   : ^(RETURN (retType=expression[locals])?) {
        if (retType == null && (symtable.getType(curFun) !=
         SymTable.voidType())) {
           System.err.println("Invalid return type in function '" + curFun +
            "' expected '" + symtable.getType(curFun) + "', found '" +
            SymTable.voidType() + "'");
        }
        else if (!retType.equals(symtable.getType(curFun))) {
           System.err.println("Invalid return type in function '" + curFun +
            "' expected '" + symtable.getType(curFun) + "', found '" +
            retType + "'");
        }

        $hasReturn = true;
     }
   ;

invocation[SymTable locals]
   : ^(INVOKE id=ID args=arguments[locals])
   ;

lvalue[SymTable locals] returns [String t = null]
   : ^(DOT structId=subvalue fieldId=ID) {
        if(!structTable.isField($structId.t, $fieldId.text)) {
           System.err.println("line " + $fieldId.line + ": invalid field '" +
            $fieldId.text + "' in struct '" + $structId.t + "'");
        }
        $t = structTable.getType($structId.t, $fieldId.text);
     }

   | valId=ID {
        if(!symtable.isDefined($valId.text)) {
           System.err.println("line " + $valId.line + ": invalid symbol '" +
            $valId.text + "'");
        }
        $t = symtable.getType($valId.text);
     }
   ;

subvalue returns [String t = null]
   : ^(DOT structId=subvalue fieldId=ID) {
        if(!structTable.isField(structId, $fieldId.text)) {
           System.err.println("line " + $fieldId.line + ": invalid field '" +
            $fieldId.text + "' in struct '" + $structId.t + "'");
        }
        $t = $fieldId.text;
     }

   | id=ID {
        if(!structTable.isDefined($id.text)) {
           System.err.println("line " + $id.line + ": undefined struct type'" +
            $id.text + "'");
        }
        $t = $id.text;
     }
   ;

expression [SymTable locals] returns [String t = null]
   : ^(AND lexpr=expression[locals] rexpr=expression[locals]) {
        if (!rexpr.equals(SymTable.boolType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else if (!lexpr.equals(SymTable.boolType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else { $t = SymTable.boolType(); }
     }

   | ^(OR lexpr=expression[locals] rexpr=expression[locals]) {
        if (!rexpr.equals(SymTable.boolType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else if (!lexpr.equals(SymTable.boolType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else { $t = SymTable.boolType(); }
     }

   | ^((EQ | LT | GT | NE | LE | GE) lexpr=expression[locals]
      rexpr=expression[locals]) {
        if (!rexpr.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'" +
            " in function " + curFun);
        }
        else if (!lexpr.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'" +
            " in function " + curFun);

        }
        else { $t = SymTable.boolType(); }
     }

   | ^((PLUS | MINUS) lexpr=expression[locals] rexpr=expression[locals]) {
        if (!rexpr.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else if (!lexpr.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else { $t = SymTable.intType(); }
     }

   | ^((TIMES | DIVIDE) lexpr=expression[locals] rexpr=expression[locals]) {
        if (!rexpr.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else if (!lexpr.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'");
        }
        else { $t = SymTable.intType(); }
     }

   | ^(NEG extype=expression[locals]) {
        if (extype.equals(SymTable.intType())) { $t = SymTable.intType(); }
        else { System.err.println("Invalid operand for negative symbol"); }
     }

   | ^(NOT expression[locals]) {
        if (extype.equals(SymTable.intType())) {
           $t = SymTable.intType();
        }
        else if (extype.equals(SymTable.boolType())) {
           $t = SymTable.boolType();
        }
        else {
           System.err.println("Invalid operand for not symbol");
        }
     }

   | ^(DOT structType=expression[locals] fieldId=ID) {
        if (structType == null) {
           System.err.print("Undefined error trying to find struct type");
           System.err.println(" on line " + $fieldId.line);
           System.exit(1);
        }
        if (!locals.containsStructType(structType)) {
           if (!symtable.containsStructType(structType)) {
              System.err.println("unexpected type: expected 'struct', found" +
               " '" + structType + "' on line " + $fieldId.line);

              System.exit(1);
           }
        }

        if(!structType.equals(SymTable.intType()) &&
         !structType.equals(SymTable.boolType())) {
           structType = structType.substring(7, structType.length());

           if(structTable.isField(structType, $fieldId.text)) {
              $t = structTable.getType(structType, $fieldId.text);
           }
        }
        else {
           System.out.println("symbol '" + $fieldId.text + "' not defined " +
            "in struct '" + SymTable.structType(structType) + "'");
        }
     }

   | ^(INVOKE id=ID args=arguments[locals]){
        $t = symtable.getType($id.text);
     }

   | id=ID {
        if (locals.isDefined($id.text)) {
           $t = locals.getType($id.text);
        }
        else if (symtable.isDefined($id.text)) {
           $t = symtable.getType($id.text);
        }
     }

   | INTEGER { $t=SymTable.intType(); }
   | TRUE { $t=SymTable.boolType(); }
   | FALSE { $t=SymTable.boolType(); }
   | ^(NEW id=ID) { $t = SymTable.structType($id.text); }
   | NULL { $t = "null"; }
   ;

arguments[SymTable locals]
   : arg_list[locals]
   ;

arg_list[SymTable locals]
   : ^(ARGS expression[locals]+)
   | ARGS
   ;
