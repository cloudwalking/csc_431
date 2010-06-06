import java.util.Hashtable;
import java.util.Enumeration;

public class RegTable {
   private Hashtable<String, Integer> table;
   private int next;
   private int zeroRegister;
   private int returnRegister;
   private int ccRegister;
   private int immediateRegister;
   
   public RegTable() {
      table = new Hashtable<String, Integer>();
      zeroRegister = 0;
      returnRegister = 1;
      ccRegister = 2;
      immediateRegister = 3;
      
      // Next register to be given out
      next = 4;
   }
   
   public int newRegister() {
      return next++;
   }
   
   public int newRegister(String id) {
      table.put(id, new Integer(next));
      return next++;
   }

   public boolean containsId(String id) {
      return table.containsKey(id);
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
   
   public void print() {
      System.out.println(table);
   }

   public int size() {
      return next;
   }
}
