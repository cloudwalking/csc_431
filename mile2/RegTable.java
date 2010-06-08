import java.util.Hashtable;
import java.util.Enumeration;
import java.util.LinkedList;

public class RegTable {
   private Hashtable<String, Integer> table;
   private Hashtable<Integer, String> reverse;
   private int next;
   private int zeroRegister;
   private int returnRegister;
   private int ccRegister;
   private int immediateRegister;
   private int outRegister;
   private int argReg0, argReg1, argReg2, argReg3, argReg4, argReg5;
   
   public RegTable() {
      table = new Hashtable<String, Integer>();
      reverse = new Hashtable<Integer, String>();
      zeroRegister = 0;
      returnRegister = 1;
      ccRegister = 2;
      immediateRegister = 3;
      outRegister = 4;
      argReg0 = 5; argReg1 = 6; argReg2 = 7; argReg3 = 8;
       argReg4 = 9; argReg5 = 10;
      
      // Next register to be given out
      next = 11;
   }

   public LinkedList<Integer> getSpecialRegisters() {
      LinkedList<Integer> returns = new LinkedList<Integer>();
      returns.add(0);
      returns.add(1);
      returns.add(2);
      returns.add(3);
      returns.add(4);
      returns.add(5);
      returns.add(6);
      returns.add(7);
      returns.add(8);
      returns.add(9);
      returns.add(10);
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
      return zeroRegister;
   }
   
   public int getReturnRegister() {
      return returnRegister;
   }
   
   public int getImmRegister() {
      return immediateRegister;
   }

   public int getCCRegister() {
      return ccRegister;
   }

   public int getOutRegister() {
      return outRegister;
   }

   public int getArgRegister(int numArg) {
      if (numArg > 5) {
         System.err.println("not enough Arg Registers: must spill args");
         return -1;
      }
      return numArg % 6 + 5;
   }
   
   public void print() {
      System.out.println(table);
      System.out.println("reverse:\n"+reverse);
   }

   public int size() {
      return next;
   }
}
