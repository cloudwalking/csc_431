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
      // Hack: take 'struct' off the front to get the raw type.
      // struct and one space = 7 chars
      if(id.contains("struct")) {
         //id = id.substring(7);
         id = id.replace("struct ", "");
      }
      return structs != null && structs.containsKey(id);
   }
   
   public boolean isField(String structId, String field) {
      return structs != null && ((SymTable)structs.get(structId)).isDefined(field);
   }

   public String getType(String struct, String field) {
      if(null == structs)
         return null;
         
      // Hack: take 'struct' off the front to get the raw type.
      // struct and one space = 7 chars
      if(struct.contains("struct")) {
         struct = struct.substring(7);
      }
      
      return ((SymTable)structs.get(struct)).getType(field);
   }

   public int getNumFields(String structId) {
      if (structId == null) System.err.println("Struct ID is null, can't get fields");
      else if (structs.get(structId) == null) System.err.println("structId: " + structId + " does not have a symTable, cannot get fields");
      else return structs.get(structId).getNumSymbols();
      return 0;
   }

   // the size of this struct in memory. it's always 4 * num fields b/c pointers to other structs are still ints
   public int getSize(String structId) {
      return 4 * structs.get(structId).getNumSymbols();
   }
   
   public int getOffset(String struct, String field) {
      // Hack: take 'struct' off the front to get the raw type.
      // 'struct ' = 7 chars
      if(struct.contains("struct")) {
         struct = struct.substring(7);
      }
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
