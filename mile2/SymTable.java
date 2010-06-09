import java.util.Set;
import java.util.LinkedHashMap;
import java.util.Map;

public class SymTable {
   public static String INT = "int";
   public static String BOOL = "bool";
   public static String STRUCT = "struct ";
   public static String VOID = "void";
   public static String NULL = "null";
   
   private LinkedHashMap<String, SymEntry> table;
   
   public SymTable() {
      table = new LinkedHashMap<String, SymEntry>();
   }
   
   public boolean insertSymbol(String symbol, String type) {
      if(null != table.get(symbol))
         return false;
      table.put(symbol, new SymEntry(symbol, type));
      return true;
   }
   
   public int setValue(String symbol, int value) {
      return ((SymEntry)table.get(symbol)).setValue(value);
   }

   public int getNumSymbols() {
      return table.size();
   }
   
   public String getType(String symbol) {
      return ((SymEntry)table.get(symbol)).getType();
   }
   
   public int getValue(String symbol) {
      return ((SymEntry)table.get(symbol)).getValue();
   }

   public Set<String> keySet() {
      return table.keySet();
   }
   
   public Map getMap() {
      return table;
   }

   public boolean contains(String symbol) {
      return table.containsKey(symbol);
   }

   public boolean containsStructType(String type) {
      if (type.equals(intType()) || type.equals(boolType()))
         return false;
      for (SymEntry symbol : table.values()) {
         if (type.equals(symbol.getType()))
            return true;
      }
      return false;
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
   public static String voidType() {
      return VOID;
   }
   public static String structType(String symbol) {
      return STRUCT + symbol;
   }
   
   public int getOffset(String field) {
      int offset = 0;
      for(SymEntry sym : table.values()) {
         if(sym.symbol.equals(field))
            break;
         offset++;
      }
      return offset;
   }
   
   public String toString() {
      return table.toString();
   }
   
   public void print() {
      print("");
   }
   
   public void print(String tabs) {
      for(String key : table.keySet()) {
         System.out.println(tabs + key + "\t:\t" + table.get(key));
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

	  public String toString() {
		 return type;
	  }
   }
}
