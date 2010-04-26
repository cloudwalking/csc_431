import java.util.Hashtable;

public class RegTable {
   private Hashtable<String, Integer> table;
   private int next;
   private int returnRegister;
   
   public RegTable() {
      table = new Hashtable<String, Integer>();
      returnRegister = 0;
      next = 1;
   }
   
   public int newRegister() {
      return next++;
   }
   
   public int newRegister(String id) {
      table.put(id, new Integer(next));
      return next++;
   }
   
   public int lookupId(String id) {
      return ((Integer)table.get(id)).intValue();
   }
   
   public int getReturnRegister() {
      return returnRegister;
   }
}