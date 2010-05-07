import java.util.LinkedList;

/**
 * Intermediate code, 4-tuple
 * http://en.wikipedia.org/wiki/Three_address_code
 * Immediate values are stored as an integer in register2, rather
 * than as a register value.
 * private class Label
 * private class Register
 * private class Immediate
 */
public class Instruction {
   private Operator op;
   private LinkedList<InstrField> fields = new LinkedList<InstrField>();
   protected String comment = "";
   
/**
 * This constructor will be used for return instructions.
 */
   public Instruction(String opString) {
      this.op = getOperator(opString);
   }
   
/**
 * This constructor will be used for call and JumpI instructions.
 * And individual instrution labels, when needed.
 */
   public Instruction(String opString, String target) {
      this.op = getOperator(opString);
      fields.add(new Label(target));
   }

/**
 * This constructor will be used for branch instructions.
 */
   public Instruction(String opString, int ccReg, String trueTarget, String 
falseTarget) {
      this.op = getOperator(opString);
      fields.add(new Register(ccReg));
      fields.add(new Label(trueTarget));
      fields.add(new Label(falseTarget));
   }

/**
 * This constructor will be used for storeret, del, I/O instructions.
 */
   public Instruction(String opString, int destReg) {
      this.op = getOperator(opString);
      fields.add(new Register(destReg));
   }

/**
 * This constructor will be used for loadi, and new instructions.
 */
   public Instruction(String opString, int imm, int destReg) {
      this.op = getOperator(opString);
      fields.add(new Immediate(imm));
      fields.add(new Register(destReg));
   }
   
/**
 * This constructor will be used for add, div, mult, sub, and, or,and other
 * instructions that have two source registers and a destination register
 * Edit: This will also be used for instructions with immediates, immediates
 * should be loaded into registers immediately before creating this 
instruction.
 */
   public Instruction(String opString, int srcReg1, int srcReg2, int destReg) 
{
      this.op = getOperator(opString);
      fields.add(new Register(srcReg1));
      fields.add(new Register(srcReg2));
      fields.add(new Register(destReg));
   }
   
   public void setComment(String comment) {
      this.comment = "\t"+comment;
   }
   
   public void setTarget(String target) {
      fields.add(new Label(target));
   }
   
/**
 * Returns OPcode representing the instruction, such as ADD, AND, GT, etc.
 */
   public static Operator getOperator(String op) {
      if (op.equals("PLUS") || op.equals("+"))
         return Operator.ADD;
      else if (op.equals("ADDI"))
         return Operator.ADDI;
      else if (op.equals("AND"))
         return Operator.AND;
      else if (op.equals("CALL"))
         return Operator.CALL;
      else if(op.equals("EQ") || op.equals("=="))
         return Operator.CBREQ;
      else if (op.equals("GE") || op.equals(">="))
         return Operator.CBRGE;
      else if (op.equals("GT") || op.equals(">"))
         return Operator.CBRGT;
      else if (op.equals("LE") || op.equals("<="))
         return Operator.CBRLE;
      else if (op.equals("LT") || op.equals("<"))
         return Operator.CBRLT;
      else if (op.equals("NE") || op.equals("!="))
         return Operator.CBRNE;
      else if (op.equals("COMP"))
         return Operator.COMP;
      else if (op.equals("COMPI"))
         return Operator.COMPI;
      else if (op.equals("CFA"))
         return Operator.COMPUTEFORMALADDRESS;
      else if (op.equals("CGA"))
         return Operator.COMPUTEGLOBALADDRESS;
      else if (op.equals("DEL"))
         return Operator.DEL;
      else if (op.equals("DIVIDE") || op.equals("/"))
         return Operator.DIV;
      else if (op.equals("JUMPI"))
         return Operator.JUMPI;
      else if(op.equals("LABEL"))
         return Operator.LABEL;
      else if (op.equals("LOADI"))
         return Operator.LOADI;
      else if (op.equals("LOADAI"))
         return Operator.LOADAI;
      else if (op.equals("LOADGLOBAL"))
         return Operator.LOADGLOBAL;
      else if (op.equals("LOADARG"))
         return Operator.LOADINARGUMENT;
      else if (op.equals("LOADRET"))
         return Operator.LOADRET;
      else if (op.equals("TIMES") || op.equals("*"))
         return Operator.MULT;
      else if (op.equals("NEW"))
         return Operator.NEW;
      else if(op.equals("NOP"))
         return Operator.NOP;
      else if (op.equals("OR"))
         return Operator.OR;
      else if (op.equals("PRINT"))
         return Operator.PRINT;
      else if (op.equals("PRINTLN"))
         return Operator.PRINTLN;
      else if (op.equals("READ"))
         return Operator.READ;
      else if (op.equals("RET"))
         return Operator.RET;
      else if (op.equals("RESTFORMAL"))
         return Operator.RESTOREFORMAL;
      else if (op.equals("SUBI"))
         return Operator.RSUBI;
      else if (op.equals("STAI"))
         return Operator.STOREAI;
      else if (op.equals("STGLBL"))
         return Operator.STOREGLOBAL;
      else if (op.equals("STIN"))
         return Operator.STOREINARGUMENT;
      else if (op.equals("STOUT"))
         return Operator.STOREOUTARGUMENT;
      else if (op.equals("STRET"))
         return Operator.STORERET;
      else if (op.equals("MINUS") || op.equals("-"))
         return Operator.SUB;
      else if (op.equals("XORI"))
         return Operator.XORI;
      else {
         System.err.println("Invalid Instruction OPCode: " + op);
         return null;
      }
   }

   public String toString() {
      return op + fields.toString() + " " + comment;
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
      LABEL,
      LOADI,
      LOADAI,
      LOADGLOBAL,
      LOADINARGUMENT,
      LOADRET,
      MULT,
      NEW,
      NOP,
      OR,
      PRINT,
      PRINTLN,
      READ,
      RET,
      RESTOREFORMAL,
      RSUBI,
      STOREAI,
      STOREGLOBAL,
      STOREINARGUMENT,
      STOREOUTARGUMENT,
      STORERET,
      SUB,
      XORI
   }

   public SparcOperator getSparc(Operator ilocOp) {
      if (ilocOp == Operator.ADD)
         return SparcOperator.ADD;
      else if (ilocOp == Operator.AND)
         return SparcOperator.AND;
      else if (ilocOp == Operator.CBREQ)
         return SparcOperator.BE;
      else if (ilocOp == Operator.CBRGT)
         return SparcOperator.BG;
      else if (ilocOp == Operator.CBRGE)
         return SparcOperator.BGE;
      else if (ilocOp == Operator.CBRLT)
         return SparcOperator.BL;
      else if (ilocOp == Operator.CBRLE)
         return SparcOperator.BLE;
      else if (ilocOp == Operator.CBRNE)
         return SparcOperator.BNE;
      else if (ilocOp == Operator.CALL)
         return SparcOperator.CALL;
      else if (ilocOp == Operator.COMP)
         return SparcOperator.CMP;
      else if (ilocOp == Operator.JUMPI)
         return SparcOperator.JMPL;
/*sttill need to change everything from here
      else if (ilocOp == Operator.LOAD)
         return SparcOperator.LDX; how to do load?*/
      else if (ilocOp == Operator.OR)
         return SparcOperator.OR;
      //else if (ilocOp == Operator.SAVE)
        // return SparcOperator.SAVE;
      else if (ilocOp == Operator.DIV)
         return SparcOperator.SDIV;
      else if (ilocOp == Operator.MULT)
         return SparcOperator.SMUL;
      //else if (ilocOp == Operator.STORE)
         //return SparcOperator.STX;
      else if (ilocOp == Operator.SUB)
         return SparcOperator.SUB;
      //else if (ilocOp == Operator.RESTORE)
         //return SparcOperator.RESTORE;
      else if (ilocOp == Operator.RET)
         return SparcOperator.RETURN;
      else if (ilocOp == Operator.XORI)
         return SparcOperator.XOR;
      else {
         System.err.println("Invalid Sparc Operator requested");
         return null;
      }
   }

   public String toSparc() {
      return getSparc(op) + fields.toString() + " " + comment;
   }

   public enum SparcOperator {
      ADD,
      SDIV,
      SMUL,
      SUB,
      AND,
      OR,
      XOR,
      CMP,
      BE,
      BNE,
      BGE,
      BL,
      BG,
      BLE,
      JMPL,
      LDX,
      STX,
      CALL,
      RETURN,
      SAVE,
      RESTORE
   }

private abstract class InstrField {
   abstract Object getValue();
}

/**
 * Represents labels/IDs that will eventually evaluate
 * to be an offset in memory.
 */
private class Label extends InstrField {
   private String name;
   public Label(String l) { name = l; }
   public String getValue() { return name; }
   public String toString() { return name; }
}

/**
 * Represents registers where values will be stored
 * when not in memory.
 */
private class Register extends InstrField {
   private Integer num;
   public Register(Integer val) { num = val; }
   public Integer getValue() { return num; }
   public String toString() { return num.toString(); }
}

/**
 * Represents raw number values in instructions.
 */
private class Immediate extends InstrField {
   private Integer val;
   public Immediate(Integer value) { val = value; }
   public Integer getValue() { return val; }
   public String toString() { return val.toString(); }
}
}
