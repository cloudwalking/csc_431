import java.util.Hashtable;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Arrays;
import java.util.List;

public class RegTable {
   private Hashtable<String, Integer> table;
   private Hashtable<Integer, String> reverse;
   private SpecialRegister[] reserved;
   int next;
   
   public RegTable() {
      table = new Hashtable<String, Integer>();
      reverse = new Hashtable<Integer, String>();
      reserved = SpecialRegister.values();
      
      // Next register to be given out
      next = reserved.length;
   }

   public LinkedList<Integer> getSpecialRegisters() {
      LinkedList<Integer> returns = new LinkedList<Integer>();
      
      List<SpecialRegister> enums = Arrays.asList(reserved);
      for(SpecialRegister reg : enums) {
         returns.add(new Integer(reg.ordinal()));
      }
      
      return returns;
   }
   
   public int newRegister() {
      return next++;
   }
   
   public int newRegister(String id) {
      Integer registerNum = new Integer(next);
      table.put(id, registerNum);
      reverse.put(registerNum, id);
      return next++;
   }

   public boolean containsId(String id) {
      return table.containsKey(id);
   }
   
   public String lookupRegister(int register) {
      return reverse.get(register);
   }

   public int lookupId(String id) {
      if (id == null) {
         System.err.println(id + " not allocated in registers");
         return -1;
      }
//      System.out.println("lookupId: "+id);
      Integer reg = table.get(id);
      if (reg == null) {
         System.err.println("no register allocated to '"+id+"'");
         return -1;
      }
      return ((Integer)table.get(id)).intValue();
   }

   public void updateRegister(String id, Integer newReg) {
      if (id == null || newReg == null) {
         System.err.println(id + " not allocated in registers");
         return;
      }
      if (!table.containsKey(id)) {
         System.err.println("invalid id, cannot reassign register: " + id);
         return;
      }
      table.put(id, newReg);
      reverse.put(newReg, id);
   }

   public int getZeroRegister() {
      return SpecialRegister.zero.ordinal();
   }
   
   public int getReturnRegister() {
      return SpecialRegister.ret.ordinal();
   }
   
   public int getImmRegister() {
      return SpecialRegister.immediate.ordinal();
   }

   public int getCCRegister() {
      return SpecialRegister.conditionCode.ordinal();
   }

   public int getOutRegister() {
      //return SpecialRegister.ret.ordinal();
      return SpecialRegister.out.ordinal();
   }

   public int getArgRegister(int numArg) {
      if (numArg > 5) {
         System.err.println("not enough Arg Registers: must spill args");
         return -1;
      }
      return SpecialRegister.arg0.ordinal() + numArg;
   }
   
   public int getInRegister(int numArg) {
      if (numArg > 5) {
         System.err.println("not enough Arg Registers: must spill args");
         return -1;
      }
      return SpecialRegister.in0.ordinal() + numArg;
   }
/*
   public int getFramePointer() {
      return SpecialRegister.frameP.ordinal();
   }

   public int getStackPointer() {
      return SpecialRegister.stackP.ordinal();
   }

   public int getImmRegister2() {
      return SpecialRegister.imm2.ordinal();
   }

   public int getSpillRegister() {
      return SpecialRegister.spill.ordinal();
   }
  */ 
   public void print() {
      System.out.println(table);
      System.out.println("reverse:\n"+reverse);
   }

   public int size() {
      return next;
   }

   private enum SpecialRegister {
      zero,
      ret,
      conditionCode,
      immediate,
      out,
      arg0,
      arg1,
      arg2,
      arg3,
      arg4,
      // taking this out because using o5 for scans.
      // you need to also see CFG.java special register list.
      //arg5,
      in0,
      in1,
      in2,
      in3,
      in4,
      in5,
      //frameP,
      //stackP,
      //imm2,
      //spill
   }
}
