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
   private String comment = "";
   
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
   
   public Register getDestinationRegister() {
/*
      for(int i = fields.size() - 1; i >= 0; i--) {
         if(fields.get(i) instanceof Register) {
            return (Register)fields.get(i);
         }
      }
*/
      if(fields.size() > 0 && fields.getLast() instanceof Register)
         return (Register)fields.getLast();
      return null;
   }
   
   public LinkedList<Register> getSourceRegisterList() {
      LinkedList<Register> returns = new LinkedList<Register>();
      for(InstrField field : fields) {
         if(field instanceof Register) {
            returns.add((Register)  field);
         }
      }
      if(returns.size() > 0)
         returns.removeLast();
      return returns;
   }
   
/**
 * Returns OPcode representing the instruction, such as ADD, AND, GT, etc.
 */
   public static Operator getOperator(String op) {
      if (op.equals("PLUS") || op.equals("+"))
         return Operator.ADD;
      else if (op.equals("ADDI"))
         return Operator.ADDI;
      else if (op.equals("AND") || op.equals("&&"))
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
      else if (op.equals("OR") || op.equals("||"))
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
//ILOC instructions to make translation to sparc easier
      else if (op.equals("SAVE"))
         return Operator.SAVE;
      else if (op.equals("RESTORE"))
         return Operator.RESTORE;
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
      XORI,
      SAVE,
      RESTORE,
   }

   public SparcOperator getSparc(Operator ilocOp) {
      if (ilocOp == Operator.ADD || ilocOp == Operator.ADDI)
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
      else if (ilocOp == Operator.COMP || ilocOp == Operator.COMPI)
         return SparcOperator.CMP;
      else if (ilocOp == Operator.JUMPI)
         return SparcOperator.BA;
      else if (ilocOp == Operator.LOADAI || ilocOp == Operator.LOADI)
         return SparcOperator.LDX;
      else if (ilocOp == Operator.OR)
         return SparcOperator.OR;
      else if (ilocOp == Operator.DIV)
         return SparcOperator.SDIV;
      else if (ilocOp == Operator.MULT)
         return SparcOperator.SMUL;
      else if (ilocOp == Operator.SAVE)
         return SparcOperator.SAVE;
      else if (ilocOp == Operator.STOREAI)
         return SparcOperator.STX;
      else if (ilocOp == Operator.SUB)
         return SparcOperator.SUB;
      else if (ilocOp == Operator.RET)
         return SparcOperator.RET;
      else if (ilocOp == Operator.RESTORE)
         return SparcOperator.RESTORE;
      else if (ilocOp == Operator.XORI)
         return SparcOperator.XOR;
//anything to be stored in out, move to an out register o0 - o5
      else if (ilocOp == Operator.STOREOUTARGUMENT)
         return SparcOperator.MOV;
      else {
         System.err.println("Invalid Sparc Operator requested: " + ilocOp);
         return null;
      }
   }

   public String toSparc() {
      if (op == Operator.COMP) {
         fields.removeLast();
      }
      else if (op == Operator.CBREQ || op == Operator.CBRGE ||
        op == Operator.CBRGT || op == Operator.CBRLE ||
        op == Operator.CBRLT || op == Operator.CBRNE) {
         InstrField otherBranch = fields.removeLast();
         return getSparc(op) + "\t" + fields.toString() + " " + comment + "\n\t" +
          SparcOperator.BA + "\t" + otherBranch + " " + comment;
      }
      else if (op == Operator.NEW) {
         //determine address where struct will be stored;
         //n++;
         //%fp - n = address of struct;
         //malloc
      }
      else if (op == Operator.DEL) {
         //get address of struct to be deleted
         //delete struct at address
         //flag as deleted?
         //free
      }
      else if (op == Operator.LOADI) {
         return "set" + "\t" + fields.toString() + " " + comment;
      }
      else if (op == Operator.LABEL) {
         return "";
      }
      else if (op == Operator.STOREINARGUMENT) {
//anything to be stored in in, need not be moved
         return "";
      }
      else if (op == Operator.SAVE) {
         //activation record = 88 bytes + locals
         return getSparc(op) + "\t" + "%sp, -800, %sp " + comment;
      }
      else if (op == Operator.PRINT) {
         String setUpper, setLower, prepCall, callScan;

//get registers from allocator
         setUpper = "sethi" + "\t" + "%hi(.EV1LPR), %g1" + "\n";
         setLower = "\t" + "or" + "\t" + "%g1, %lo(.EV1LPR), %o0" + "\n";
         prepCall = "\t" + "mov" + "\t" + "%o5, %o1" + "\n";
         callScan = "\t" + "call" + "\t" + "printf, 0" + "\n";

         return setUpper + setLower + prepCall + callScan;
      }
      else if (op == Operator.PRINTLN) {
         String setUpper, setLower, prepCall, callScan;

//get registers from allocator
         setUpper = "sethi" + "\t" + "%hi(.EV1LPRL), %g1" + "\n";
         setLower = "\t" + "or" + "\t" + "%g1, %lo(.EV1LPRL), %o0" + "\n";
         prepCall = "\t" + "mov" + "\t" + "%o5, %o1" + "\n";
         callScan = "\t" + "call" + "\t" + "printf, 0" + "\n";

         return setUpper + setLower + prepCall + callScan;
      }
      else if (op == Operator.READ) {
         String setUpper, setLower, prepCall, callScan;

//get registers from allocator
         setUpper = "sethi" + "\t" + "%hi(.EV1LRD), %g1" + "\n";
         setLower = "\t" + "or" + "\t" + "%g1, %lo(.EV1LRD), %o0" + "\n";
         prepCall = "\t" + "mov" + "\t" + "%o5, %o1" + "\n";
         callScan = "\t" + "call" + "\t" + "scanf, 0" + "\n";

         return setUpper + setLower + prepCall + callScan;
      }
      return getSparc(op) + "\t" + fields.toString() + " " + comment;
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
      BA,
      JMPL,
      LDX,
      MOV,
      NOP,
      STX,
      CALL,
      RET,
      SAVE,
      RESTORE
   }

// InstrField now a public class.

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

// Register now a public class.

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
