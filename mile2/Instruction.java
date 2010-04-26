import java.util.ArrayList;

/**
 * Intermediate code, 4-tuple
 * http://en.wikipedia.org/wiki/Three_address_code
 * Immediate values are stored as an integer in register2, rather
 * than as a register value.
 */
public class Instruction {
   private Operator op;
   private int register1;
   private int register2;
   private int result;
   private int immediate;
   
   private String type;
   private ArrayList<String> fieldNames;
   
   public Instruction(Operator op) {
      this(op, (Integer)null, (Integer)null, (Integer)null);
   }
   
   public Instruction(Operator op, int result) {
      this(op, (Integer)null, (Integer)null, result);
   }
   
   public Instruction(Operator op, String type, ArrayList<String> fieldNames) {
      this.op = op;
      this.type = type;
      this.fieldNames = fieldNames;
   }
   
   public Instruction(Operator op, int result, int immediate) {
      this(op, (Integer)null, immediate, result);
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
