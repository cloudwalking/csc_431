import java.util.Hashtable;

public class LabelTable {
   private Hashtable<String, String> table;
   private int structCounter, localCounter;
   private int funCounter, stateCounter, fieldCounter;

   public LabelTable() {
      table = new Hashtable<String, String>();
      structCounter = 0;
      localCounter = 0;
      funCounter = 0;
      stateCounter = 0;
      fieldCounter = 0;
   }

   public String newStructLabel(String structID) {
      String structLabel = "struct" + structCounter++;
      table.put(structID, structLabel);
      return structLabel;
   }

   public String newFieldLabel(String fieldID) {
      String fieldLabel = "field" + fieldCounter++;
      table.put(fieldID, fieldLabel);
      return fieldLabel;
   }

   public String newLocalLabel(String localID) {
      String localLabel = "local" + localCounter++;
      table.put(localID, localLabel);
      return localLabel;
   }

   public String newFunctionLabel(String funID) {
      String funLabel = "function" + funCounter++;
      table.put(funID, funLabel);
      return funLabel;
   }

   public String newStatementLabel(String stateID) {
      String stateLabel = "statement" + stateCounter++;
      table.put(stateID, stateLabel);
      return stateLabel;
   }

   public String lookupID(String id) {
      if (id == null) {
         System.err.println(id + " not associated with a label");
         return null;
      }
      String label = table.get(id);

      if (label == null) {
         System.err.println("invalid label associated with " + id);
         return null;
      }
      return label;
   }
}
