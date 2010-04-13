import java.util.LinkedHashMap;
import java.util.Map;

public class SymTable {
   public static String INT = "int";
   public static String BOOL = "bool";
   public static String STRUCT = "struct ";
   public static String VOID = "void";
   
   private LinkedHashMap<String, SymEntry> table;
   
   public SymTable() {
      table = new LinkedHashMap<String, SymEntry>();
   }
   
   public void insertSymbol(String symbol, String type) {
      table.put(symbol, new SymEntry(symbol, type));
   }
   
   public int setValue(String symbol, int value) {
      return ((SymEntry)table.get(symbol)).setValue(value);
   }
   
   public String getType(String symbol) {
      return ((SymEntry)table.get(symbol)).getType();
   }
   
   public int getValue(String symbol) {
      return ((SymEntry)table.get(symbol)).getValue();
   }
   
   public Map getMap() {
      return table;
   }
   
   public boolean isDefined(String symbol) {
      return table != null && table.containsKey(symbol);
   }
   
   public static String intType() {
      return INT;
   }
   public static String boolType() {
      return BOOL;
   }
   public static String structType(String symbol) {
      return STRUCT + symbol;
   }
   
   public String toString() {
      return table.toString();
   }
   
   public void print() {
      print(null);
   }
   
   public void print(String tabs) {
      for(String key : table.keySet()) {
         System.out.println(tabs + key + " : " + table.get(key));
      }
   }
   
   private class SymEntry {
      String symbol;
      String type;
      int value;
      
      public SymEntry(String symbol, String type) {
         this.symbol = symbol;
         this.type = type;
      }
      
      public String getType() {
         return type;
      }
      
      public int setValue(int value) {
         this.value = value;
         return this.value;
      }
      
      public int getValue() {
         return value;
      }
   }
}
