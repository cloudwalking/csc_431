import java.util.Hashtable;

public class StructTable {
   private Hashtable<String, SymTable> structs = null;
   private int INT_SIZE = 4;
   
   private boolean DEBUG = false;
   
   public StructTable() {
      structs = new Hashtable<String, SymTable>();
   }
   
   public SymTable getSymbolTable(String id) {
      return structs.get(id);
   }

   public boolean addStruct(String id) {
      if (structs.containsKey(id))
         return false;
      if(DEBUG) System.out.println("j> adding struct '" + id + "'");
      // SymTable doesn't matter, we're gonna overwrite it in update
      structs.put(id, new SymTable());
      return true;
   }
/*
   public boolean addStruct(String id, SymTable nestedDecls) {
      if (structs.containsKey(id))
         return false;
      structs.put(id, nestedDecls);
      return true;
   }
*/
   public boolean updateStruct(String id, SymTable nestedDecls) {
      if (!structs.containsKey(id))
         return false;
      structs.put(id, nestedDecls);
      return true;
   }

   public boolean isDefined(String id) {
      return structs != null && structs.containsKey(id);
   }
   
   public boolean isField(String structId, String field) {
      return structs != null && ((SymTable)structs.get(structId)).isDefined(field);
   }

   public String getType(String struct, String field) {
      if(null == structs)
         return null;
      return ((SymTable)structs.get(struct)).getType(field);
   }
   
   public int getOffest(String struct, String field) {
      // Hack: take 'struct' off the front to get the raw type.
      // struct and one space = 7 chars
      struct = struct.substring(7);
      return INT_SIZE * structs.get(struct).getOffset(field);
   }
   
   public void print() {
      print("");
   }
   
   public void print(String tabs) {
      for(String key : structs.keySet()) {
         System.out.println(tabs + key + "\t:\t" + structs.get(key));
         //structs.get(key).print("\t\t");
      }
   }
}
