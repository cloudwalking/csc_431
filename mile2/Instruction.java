/**
 * Intermediate code, 4-tuple
 * http://en.wikipedia.org/wiki/Three_address_code
 */
public class Instruction {
   private Operator op;
   private int register1;
   private int register2;
   private int result;
   private int immediate;
   
   public Instruction(Operator op, int register1, int immediate) {
      this.op = op;
      this.register1 = register1;
      this.register2 = register2;
      this.immediate = immediate;
   }
   
   public Instruction(Operator op, int register1, int register2, int result) {
      this.op = op;
      this.register1 = register1;
      this.register2 = register2;
      this.result = result;
   }
   
   public static Operator getOperator(String op) {
      //EQ | LT | GT | NE | LE | GE
      //Operator returns;
      if (op.equals("AND"))
         return Operator.AND;
      else if (op.equals("OR"))
         return Operator.OR;
      else if(op.equals("EQ"))
         return Operator.CBREQ;
      else if (op.equals("LT"))
         return Operator.CBRLT;
      else if (op.equals("GT"))
         return Operator.CBRGT;
      else if (op.equals("NE"))
         return Operator.CBRNE;
      else if (op.equals("LE"))
         return Operator.CBRLE;
      else if (op.equals("GE"))
         return Operator.CBRGE;
      else if (op.equals("PLUS"))
         return Operator.ADD;
      else if (op.equals("MINUS"))
         return Operator.SUB;
      else if (op.equals("TIMES"))
         return Operator.MULT;
      else if (op.equals("DIVIDE"))
         return Operator.DIV;
      return null;
   }
   public enum Operator {
      ADD,
      ADDI,
      AND,
      CALL,
      CBREQ,
      CBRGE,
      CBRGT,
      CBRLE,
      CBRLT,
      CBRNE,
      COMP,
      COMPI,
      COMPUTEFORMALADDRESS,
      COMPUTEGLOBALADDRESS,
      DEL,
      DIV,
      JUMPI,
      LOADI,
      LOADAI,
      LOADGLOBAL,
      LOADINARGUMENT,
      LOADRET,
      MULT,
      NEW,
      OR,
      PRINT,
      PRINTLN,
      READ,
      RET,
      RESTOREFORMAL,
      RSUBI,
      STOREAI,
      STOREGLOBAL,
      STOREINAGRUMENT,
      STOREOUTARGUMENT,
      STORERET,
      SUB,
      XORI
   }
}
