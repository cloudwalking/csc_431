/**
 * Intermediate code, 4-tuple
 * http://en.wikipedia.org/wiki/Three_address_code
 */
public class Instruction {
   private Operator op;
   private int register1;
   private int register2;
   private int result;
   
   public Instruction(Operator op, int register1, int immediate) {
      this(op, register1, immediate);
   }
   
   public Instruction(Operator op, int register1, int register2, int result) {
      this.op = op;
      this.register1 = register1;
      this.register2 = register2;
      this.result = result;
   }
   
/*
   public static Operator getOperator(String op) {
      //EQ | LT | GT | NE | LE | GE
      Operator returns;
      if(op.equals("EQ"))
         returns = Operator.EQ;
   }
*/
   public enum Operator {
      ADD,
      ADDI,
      DIV,
      MULT,
      SUB,
      RSUBI,
      AND,
      OR,
      XORI,
      COMP,
      COMPI,
      CBREQ,
      CBRGE,
      CBRGT,
      CBRLE,
      CBRLT,
      CBRNE,
      JUMPI,
      LOADI,
      LOADAI,
      LOADGLOBAL,
      LOADINARGUMENT,
      LOADRET,
      COMPUTEFORMALADDRESS,
      RESTOREFORMAL,
      COMPUTEGLOBALADDRESS,
      STOREAI,
      STOREGLOBAL,
      STOREINAGRUMENT,
      STOREOUTARGUMENT,
      STORERET,
      CALL,
      RET,
      NEW,
      DEL,
      PRINT,
      PRINTLN,
      READ
   }
}