import java.util.LinkedList;
import java.util.Hashtable;

//////////////
//////////////
//////////////
/* This single class for Instructions was a terrible idea. */
//////////////
//////////////
//////////////
//////////////


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
 * And individual instruction labels, when needed.
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
 * I found out the hard way that it's also used for more than just loadi and new.
 */
   public Instruction(String opString, int imm, int destReg) {
      this.op = getOperator(opString);
      if (opString.endsWith("I") || opString.endsWith("i")) {
         fields.add(new Immediate(imm));
      }
      else if (opString.equals("NEW")) {
         //System.out.println("NEW inst: "+imm+", "+destReg);
         fields.add(new Immediate(imm));
      }
      else fields.add(new Register(imm));
      fields.add(new Register(destReg));
   }

   /* for load w/ spills */
   public Instruction(String opString, Register src, int imm, Register dest) {
      this.op = getOperator(opString);
      fields.add(src);
      fields.add(new Immediate(imm));
      fields.add(dest);
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
      
      if(opString.equals("LOADAI"))
         fields.add(new Immediate(srcReg2));
      else
         fields.add(new Register(srcReg2));
      
      if(opString.equals("STAI"))
         fields.add(new Immediate(destReg));
      else
         fields.add(new Register(destReg));
   }
  
/**
  * Use this for stai (st)
  */
public Instruction(String opString, Register srcReg1, Register srcReg2, int imm) {
   this.op = getOperator(opString);
   fields.add(srcReg1);
   fields.add(srcReg2);
   fields.add(new Immediate(imm));
}

/*
public Instruction(String opString, Register srcReg, int destReg) {
   this.op = getOperator(opString);
   fields.add(srcReg);
   fields.add(new Register(destReg));
}
*/
   public void setComment(String comment) {
      this.comment = "\t!"+comment;
   }
   
   public void setTarget(String target) {
      fields.add(new Label(target));
   }
   
   public Immediate getImmediateRegister() {
      for(int i=0; i<fields.size(); i++) {
         if(fields.get(i) instanceof Immediate)
            return (Immediate)fields.get(i);
      }
      return null;
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
      if(returns.size() > 0 && this.op != Operator.STOREAI)
         returns.removeLast();
      return returns;
   }
  
   public int countUncoloredRegisters() {
      int count = 0;
      for(InstrField field : fields) {
         if(field instanceof Register) {
            if(((Register)field).getColor() == null) {
               //System.out.println("null color");
               count++;
            }
         }
      }
      return count;
   }

   public void reregister(Hashtable key) {
      for(InstrField field : fields) {
         if(field instanceof Register) {
            int r = ((Register)field).getValue().intValue();
            //if (key.get(r) == null) System.out.println("SPILLL: " + r);
            String color = (String)key.get(r);
            ((Register)field).setColor(color);
         }
      }
   }

   // change register numbers based on what color they are. mappings are 
   // made in the given hashtable.
   public void uncolor(Hashtable key) {
      for(InstrField field : fields) {
         if(field instanceof Register) {
            String color = ((Register)field).getColor();
            Integer newVal = (Integer)key.get(color);
            ((Register)field).setNum(newVal);
            ((Register)field).setColor(null);
         }
      }
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
      else if (op.equals("MOV"))
         return Operator.MOV;
      else if (op.equals("MOVEQ"))
         return Operator.MOVEQ;
      else if (op.equals("MOVLT"))
         return Operator.MOVLT;
      else if (op.equals("MOVGT"))
         return Operator.MOVGT;
      else if (op.equals("MOVNE"))
         return Operator.MOVNE;
      else if (op.equals("MOVLE"))
         return Operator.MOVLE;
      else if (op.equals("MOVGE"))
         return Operator.MOVGE;
      else {
         System.err.println("Invalid Instruction OPCode: " + op);
         return null;
      }
   }

   public String toString() {
      //return op + fields.toString() + " " + comment;
      return op + fields.toString();
   }

   public String toString(boolean iloc) {
      //return op + fields.toString() + " " + comment;
      String fieldStrings = "";
      for (InstrField f : fields) {
         fieldStrings += f.toString(iloc) + ", ";
      }
      int end = fieldStrings.lastIndexOf(", ") > 0 ?
         fieldStrings.lastIndexOf(", ") : fieldStrings.length();
      return op + "\t" + fieldStrings.substring(0, end);
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
      MOV,
      MOVEQ,
      MOVLT,
      MOVGT,
      MOVNE,
      MOVLE,
      MOVGE,
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
         return SparcOperator.add;
      else if (ilocOp == Operator.AND)
         return SparcOperator.and;
      else if (ilocOp == Operator.CBREQ)
         return SparcOperator.be;
      else if (ilocOp == Operator.CBRGT)
         return SparcOperator.bg;
      else if (ilocOp == Operator.CBRGE)
         return SparcOperator.bge;
      else if (ilocOp == Operator.CBRLT)
         return SparcOperator.bl;
      else if (ilocOp == Operator.CBRLE)
         return SparcOperator.ble;
      else if (ilocOp == Operator.CBRNE)
         return SparcOperator.bne;
      else if (ilocOp == Operator.CALL)
         return SparcOperator.call;
      else if (ilocOp == Operator.COMP || ilocOp == Operator.COMPI)
         return SparcOperator.cmp;
      else if (ilocOp == Operator.JUMPI)
         return SparcOperator.ba;
      else if (ilocOp == Operator.LOADAI || ilocOp == Operator.LOADI)
         return SparcOperator.ld;
      else if (ilocOp == Operator.OR)
         return SparcOperator.or;
      else if (ilocOp == Operator.DIV)
         return SparcOperator.sdiv;
      else if (ilocOp == Operator.MULT)
         return SparcOperator.smul;
      else if (ilocOp == Operator.SAVE)
         return SparcOperator.save;
      else if (ilocOp == Operator.STOREAI)
         return SparcOperator.st;
      else if (ilocOp == Operator.SUB)
         return SparcOperator.sub;
      else if (ilocOp == Operator.RET)
         return SparcOperator.ret;
      else if (ilocOp == Operator.RESTORE)
         return SparcOperator.restore;
      else if (ilocOp == Operator.XORI)
         return SparcOperator.xor;
//anything to be stored in out, move to an out register o0 - o5
      else if (ilocOp == Operator.STOREOUTARGUMENT || ilocOp == Operator.MOV ||
       ilocOp == Operator.STOREINARGUMENT)
         return SparcOperator.mov;
      else if (ilocOp == Operator.MOVEQ)
         return SparcOperator.move;
      else if (ilocOp == Operator.MOVLT)
         return SparcOperator.movl;
      else if (ilocOp == Operator.MOVGT)
         return SparcOperator.movg;
      else if (ilocOp == Operator.MOVNE)
         return SparcOperator.movne;
      else if (ilocOp == Operator.MOVLE)
         return SparcOperator.movle;
      else if (ilocOp == Operator.MOVGE)
         return SparcOperator.movge;
      else {
         System.err.println("Invalid Sparc Operator requested: " + ilocOp);
         return null;
      }
   }

   public String toSparc() {
      if (op == Operator.COMP) {
         fields.removeLast();
      }
      else if (op == Operator.CALL) {
         return getSparc(op) + "\t" +
          fields.toString().replace("[", " ").replace("]", "\t") + "\n\t" + "nop";
      }
      else if (op == Operator.MOVEQ || op == Operator.MOVLT ||
       op == Operator.MOVGT || op == Operator.MOVNE || op == Operator.MOVLE ||
       op == Operator.MOVGE) {
         return getSparc(op) + "\t" +
          fields.toString().replace("[", " ").replace("]", "\t") + " " +
          comment;
       }
      else if (op == Operator.CBREQ || op == Operator.CBRGE ||
        op == Operator.CBRGT || op == Operator.CBRLE ||
        op == Operator.CBRLT || op == Operator.CBRNE) {
         InstrField otherBranch = fields.removeLast();
         fields.removeFirst();
         return getSparc(op) + "\t" +
          fields.toString().replace("[", " ").replace("]", "\t") + " " + comment +
          "\n\t" + SparcOperator.nop + "\n\t" +
          SparcOperator.ba + "\t" + otherBranch + " " + comment + "\n\t" +
          SparcOperator.nop;
      }
      else if (op == Operator.NEW) {
         /*return getSparc(Operator.CALL) + "\t" + "malloc, 0" + "\n\t" +
          "nop" + " " + comment;
          */
         //System.out.println("NEW inst, fields: "+fields);
         return getSparc(Operator.MOV) + "\t" + fields.removeFirst() + ", %o0" + "\n\t" +
                getSparc(Operator.CALL) + "\t" + "malloc" + "\n\t" +
                "nop";
                //getSparc(Operator.MOV) + "\t" + "%o0," + fields.removeFirst() + "\n\t";
      }
      else if (op == Operator.DEL) {
         return getSparc(Operator.CALL) + "\t" + "free, 0" + "\n\t" +
          "nop" + " " + comment;
      }
      // try this with negative numbers, doesn't work.
      // changing from set to mov.
      // then changed to be smart: positives are set, negatives are mov. wont work on big negatives.
      else if (op == Operator.LOADI) {
         String operation = "set";
         if(fields.getFirst() != null && 
               fields.getFirst() instanceof Immediate &&
               ((Integer)fields.getFirst().getValue()).intValue() < 0) {
            operation = "mov";
         }
         return operation + "\t" +
          fields.toString().replace("[", " ").replace("]", "\t") + " " + comment;
      }
      else if (op == Operator.LOADAI) {
         InstrField srcReg = fields.removeFirst();
         InstrField offsetReg = fields.removeFirst();
         InstrField destReg = getDestinationRegister();
         return getSparc(op) + "\t" + "[" + srcReg + " + " +
          offsetReg + "], " + destReg;
      }
      else if (op == Operator.STOREAI) {
         InstrField srcReg = fields.removeFirst();
         InstrField destReg = fields.removeFirst();
         // use immedate register for spilling, destination register for not spilling.
         // this is a bug I haven't fixed.
         InstrField offsetReg = getDestinationRegister();
         if(null == offsetReg)
            offsetReg = getImmediateRegister();
         return getSparc(op) + "\t" + srcReg + ", [" + destReg + " + " +
          offsetReg + "]";
      }
      else if (op == Operator.LABEL) {
         return "";
      }
      else if (op == Operator.SAVE) {
         //activation record = 88 bytes + locals
         return getSparc(op) + "\t" + "%sp, -800, %sp " + comment;
      }
      else if (op == Operator.RET) {
         return getSparc(op) + "\n\t" + "restore";
      }
      else if (op == Operator.PRINT) {
         String setUpper, setLower, prepCall, callScan;

//get registers from allocator
         setUpper = "sethi" + "\t" + "%hi(.EV1LPR), %g1" + "\n";
         setLower = "\t" + "or" + "\t" + "%g1, %lo(.EV1LPR), %o0" + "\n";
         //replace %o5 with variable
         prepCall = "\t" + "mov" + "\t" + getDestinationRegister() +
          ", %o1" + "\n";
         callScan = "\t" + "call" + "\t" + "printf, 0" + "\n\t" +
            "nop";

         return setUpper + setLower + prepCall + callScan;
      }
      else if (op == Operator.PRINTLN) {
         String setUpper, setLower, prepCall, callScan;

//get registers from allocator
         setUpper = "sethi" + "\t" + "%hi(.EV1LPRL), %g1" + "\n";
         setLower = "\t" + "or" + "\t" + "%g1, %lo(.EV1LPRL), %o0" + "\n";
         prepCall = "\t" + "mov" + "\t" + getDestinationRegister() +
          ", %o1" + "\n";
         callScan = "\t" + "call" + "\t" + "printf, 0" + "\n\t" +
            "nop";

         return setUpper + setLower + prepCall + callScan;
      }
      else if (op == Operator.READ) {
         String prepRegister;
         String setUpper, setLower, prepCall, callScan;

         prepRegister = "add" + "\t" + "%sp, %g0, " + getDestinationRegister() +
          "\n\t" + "nop" + "\n";
//get registers from allocator
         setUpper = "\t" + "sethi" + "\t" + "%hi(.EV1LRD), %g1" + "\n";
         setLower = "\t" + "or" + "\t" + "%g1, %lo(.EV1LRD), %o0" + "\n";
         
         /*
         // adding this store because I think read is broken otherwise.
         // learned this from eric
         String storeSetUpper = "\t sethi %hi(readplz), %o5\n";
         String storeSetLower = "\t or %o5, %lo(readplz), %o5\n";
         String store = "st " + getDestinationRegister() + ", [%o5]\n";
         */
         
         // I think this is wrong, we need to move the address of the register rather than the register.
         //prepCall = "\t" + "mov" + "\t" + getDestinationRegister() +", %o1" + "\n";
         prepCall = "\t" + "set readplz, %o1 "  + "\n";
         // since the scan is stored in readplz, move it back to the dest register
         String finish = "\t" + "ld [%o1], " + getDestinationRegister() + "\n";
         
         callScan = "\t" + "call" + "\t" + "scanf, 0" + "\n\t" + "nop\n";

         //return prepRegister + setUpper + setLower + storeSetUpper + storeSetLower + store  + prepCall + callScan;
         return prepRegister + setUpper + setLower + prepCall + callScan + finish;
      }
      else if (op == Operator.JUMPI) {
         return getSparc(op) + "\t" +
          fields.toString().replace("[", " ").replace("]", "\t") + " " + comment +
          "\n\t" + "nop";
      }
      return getSparc(op) + "\t" +
       fields.toString().replace("[", " ").replace("]", "\t") + " " + comment;
   }

   public enum SparcOperator {
      add,
      sdiv,
      smul,
      sub,
      and,
      or,
      xor,
      cmp,
      be,
      bne,
      bge,
      bl,
      bg,
      ble,
      ba,
      jmpl,
      ld,
      mov,
      move,
      movl,
      movg,
      movne,
      movle,
      movge,
      nop,
      st,
      call,
      ret,
      save,
      restore
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
   public String toString(boolean dontuseit) { return name; }
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
   public String toString(boolean iloc) { return val.toString(); }
}

}
