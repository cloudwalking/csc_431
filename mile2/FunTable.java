import java.util.Hashtable;

public class FunTable {
   private Hashtable<String, SymTable> functions = null;
   
   public FunTable() {
      functions = new Hashtable<String, SymTable>();
   }
   
   public SymTable getFunctionTable(String id) {
      return functions.get(id);
   }

   public boolean addFunction(String id, SymTable parameters) {
      if (functions.containsKey(id))
         return false;
      functions.put(id, parameters);
      return true;
   }
   
   public boolean updateFunction(String id, SymTable moreVars) {
      if (!functions.containsKey(id))
         return false;
      if(null == moreVars)
         return false;
      functions.put(id, moreVars);
      return true;
   }

   public boolean isDefined(String id) {
      return functions != null && functions.containsKey(id);
   }
   
   /**
    * Gets the field's type, in the context of the given function.
    */
   public String getType(String function, String field) {
      return functions.get(function).getType(field);
   }

   public int getOffset(String function, String field) {
      int ndx = 0;
      for (String s : functions.get(function).keySet()) {
         if (s == field) return ndx * 4;
         else ndx++;
      }
      return -1;
   }

   public void print() {
      print("");
   }
   
   public void print(String tabs) {
      for(String key : functions.keySet()) {
         System.out.println(tabs + key + "\t:\t" + functions.get(key));
         functions.get(key).print("\t\t");
      }
   }
}
