import java.util.Hashtable;

public class StructTable {
   private Hashtable<String, SymTable> structs = null;
   
   public StructTable() {
      structs = new Hashtable<String, SymTable>();
   }
   
   public SymTable getSymbolTable(String id) {
      return structs.get(id);
   }

   public boolean addStruct(String id, SymTable nestedDecls) {
      if (structs.containsKey(id))
         return false;
      structs.put(id, nestedDecls);
      return true;
   }

   public boolean isDefined(String id) {
      return structs != null && structs.containsKey(id);
   }
}
