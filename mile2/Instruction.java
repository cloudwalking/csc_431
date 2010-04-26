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