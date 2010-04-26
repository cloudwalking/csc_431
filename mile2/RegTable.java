import java.util.Hashtable;

public class RegTable {
   private Hashtable<String, Integer> table;
   private int next;
   private int returnRegister;
   private int ccRegister;
   
   public RegTable() {
      table = new Hashtable<String, Integer>();
      returnRegister = 0;
      ccRegister = 1;
      next = 2;
   }
   
   public int newRegister() {
      return next++;
   }
   
   public int newRegister(String id) {
      table.put(id, new Integer(next));
      return next++;
   }
   
   public int lookupId(String id) {
      if (id == null) {
         System.err.println(id + " not allocated in registers");
         return -1;
      }
      Integer reg = table.get(id);
      if (reg == null) {
         System.err.println("invalid register allocated to " + id);
         return -1;
      }
      return ((Integer)table.get(id)).intValue();
   }
   
   public int getReturnRegister() {
      return returnRegister;
   }

   public int getCCRegister() {
      return ccRegister;
   }
}
