import java.util.Hashtable;

public class StructTable {
   private Hashtable<String, SymTable> structs = null;
   
   public StructTable() {
      structs = new Hashtable<String, SymTable>();
   }
   
   public SymTable getSymbolTable(String id) {
      return structs.get(id);
   }

   public boolean addStruct(String id) {
      if (structs.containsKey(id))
         return false;
      structs.put(id, (SymTable)null);
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
   
   public boolean isField(String id) {
      return structs != null && 
   }
   
   public void print() {
      print("");
   }
   
   public void print(String tabs) {
      System.out.println("\n** StructTable **");
      for(String key : structs.keySet()) {
         System.out.println(tabs + key + "\t:\t" + structs.get(key));
         structs.get(key).print("\t\t");
      }
      System.out.println(" ");
   }
}
