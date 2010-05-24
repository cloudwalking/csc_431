//make certain structuress global, then propagate changes
tree grammar EvilAST;

options {
  language = Java;
  tokenVocab = Evil;
  ASTLabelType = CommonTree;
}

@members{
   StructTable structTable;
   FunTable funTable;
   SymTable symtable = new SymTable();
   String curFun;
   String curStruct = null;
}

program[StructTable stable, FunTable fun]
@init { structTable = stable;
        funTable = fun; }
   : ^(PROGRAM types declarations[symtable] functions) {
        if (!symtable.contains("main")) {
           System.err.println("main function not defined");
           System.exit(1);
        }
     }
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
           System.err.println("line " + $id.line + ": symbol '" + $id +
            "' already defined");
        }
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

statement[SymTable locals, boolean hasReturn] returns
[boolean retVal = false]
//@init{ System.out.println("statement on line " + getLine()); }
   : ^(BLOCK ^(STMTS (r=statement[locals, hasReturn])*)) {
        $retVal = $r.retVal || $hasReturn;
     }
   | ^(STMTS (r=statement[locals, hasReturn])*) {
        $retVal = $r.retVal || $hasReturn;
     }
   | assignment[locals] { $retVal = $hasReturn; }
   | print[locals] { $retVal = $hasReturn; }
   | read[locals] { $retVal = $hasReturn; }
   | ^(IF expression[locals] rthen=statement[locals, hasReturn]
      (relse=statement[locals, hasReturn])?) {
        $retVal = (($rthen.retVal && $relse.retVal) || $hasReturn);
     }
   | ^(WHILE expr=expression[locals] r=statement[locals, hasReturn]
      expr2=expression[locals]) {
        $retVal = $r.retVal;
     }
   | delete[locals] { $retVal = $hasReturn; }
   | r2=ret[locals] { $retVal = $r2.hasReturn; }
   | invocation[locals] { $retVal = $hasReturn; }
   ;

assignment[SymTable locals]
   : ^(ASSIGN exprType=expression[locals] lvalType=lvalue[locals]) {
        if(!$lvalType.t.equals($exprType.t)) {
           if (structTable.isDefined($lvalType.t.replace("struct ", ""))) {
              if (!$exprType.t.equals("null") ) {
                 System.err.println("Type Mismatch in assignment: found '" +
                  $exprType.t + "', expected '" + $lvalType.t + "'");
              }
           }
           else {
              System.err.println("Type Mismatch in assignment: found '" +
               $exprType.t + "' type, expected '" + $lvalType.t + "'");
           }
        }
     }
   ;

print[SymTable locals]
   : ^(PRINT extype=expression[locals] (ENDL)?) {
        if ($extype.t != null && !$extype.t.equals(SymTable.intType())) {
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
if (retType == null) { $hasReturn = true; }
        else if ($retType.t == null && (symtable.getType(curFun) !=
         SymTable.voidType())) {
           System.err.println("Invalid return type in function '" + curFun +
            "' expected '" + symtable.getType(curFun) + "', found '" +
            SymTable.voidType() + "'");
        }

        else if (!$retType.t.equals(symtable.getType(curFun))) {
           if ($retType.t != "null" || (!structTable.isDefined(
            symtable.getType(curFun).replace("struct ", "")))) {
              System.err.println("Invalid return type in function '" + curFun +
               "' expected '" + symtable.getType(curFun) + "', found '" +
               $retType.t + "'");
           }
        }

        $hasReturn = true;
     }
   ;

invocation[SymTable locals]
   : ^(INVOKE id=ID args=arguments[locals])
   ;

lvalue[SymTable locals] returns [String t = null]
   : ^(DOT structId=subvalue[locals] fieldId=ID) {
        if(!structTable.isField($structId.t, $fieldId.text)) {
           System.err.println("line " + $fieldId.line + ": invalid field '" +
            $fieldId.text + "' in struct '" + $structId.t + "'");
        }
        $t = structTable.getType($structId.t, $fieldId.text);
     }

   | valId=ID {
        if(locals.isDefined($valId.text)) {
           $t = locals.getType($valId.text);
        }
        else if(symtable.isDefined($valId.text)) {
           $t = symtable.getType($valId.text);
        } else {
           System.err.println("line " + $valId.line + ": invalid symbol '" +
            $valId.text + "'");
        }
     }
   ;

subvalue[SymTable locals] returns [String t = null]
   : ^(DOT structId=subvalue[locals] fieldId=ID) {
        if(!structTable.isField($structId.t, $fieldId.text)) {
           System.err.println("line " + $fieldId.line + ": invalid field '" +
            $fieldId.text + "' in struct '" + $structId.t + "'");
        }
        $t = structTable.getType($structId.t, $fieldId.text).replace("struct ", "");
     }

   | id=ID {
        String type = null;
        if(locals.isDefined($id.text)) {
           type = locals.getType($id.text);
        }
        else if(symtable.isDefined($id.text)) {
           type = symtable.getType($id.text);
        }
        else {
           System.err.println("line " + $id.line + ": invalid symbol '" +
              $id.text + "'");
        }
        
        if(type == null) {
           System.err.println("line " + $id.line + ": undefined struct type'" +
            type + "'");
        }

        // Hack: take struct off the front to get the raw type.
        type = type.replace("struct ", "");
        
        if(!structTable.isDefined(type)) {
           System.err.println("line " + $id.line + ": undefined struct type'" +
            type + "'");
        }
        $t = type;
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

        if (structTable.isDefined($lexpr.t.replace("struct ", "")) ||
         structTable.isDefined(rexpr.replace("struct ", ""))) {

           if (!$lexpr.t.equals($rexpr.t)) {
              if ($rexpr.t.equals("null") || $lexpr.t.equals("null")) { $t = SymTable.boolType(); }

              else if (!$rexpr.t.equals("null") && !$lexpr.t.equals("null")) {
                 System.err.println("Invalid equality operation: expected 'struct'" +
                  " and 'null', found '" + $lexpr.t + "' and '" + $rexpr.t +
                  "' in function " + curFun);
              }

              else {
                 System.err.println("Invalid equality operation: expected '" +
                  $lexpr.t + "' and '" + $lexpr.t + "', found '" + $lexpr.t +
                  "' and '" + $rexpr.t + "' in function " + curFun);
              }
           }

           else { $t = SymTable.boolType(); }

        }
        else if (!$rexpr.t.equals(SymTable.intType())) {
           System.err.println("Invalid arithmetic operation: expected 'int'" +
            " and 'int', found '" + lexpr + "' and '" + rexpr + "'" +
            " in function " + curFun);
        }
        else if (!$lexpr.t.equals(SymTable.intType())) {
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
        if ($extype.t.equals(SymTable.intType())) { $t = SymTable.intType(); }
        else { System.err.println("Invalid operand for negative symbol");$t = SymTable.boolType(); }
     }

   | ^(NOT extype=expression[locals]) {
        if ($extype.t.equals(SymTable.intType())) {
           $t = SymTable.intType();
        }
        else if ($extype.t.equals(SymTable.boolType())) {
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
