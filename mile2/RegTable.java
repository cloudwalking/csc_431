

public class RegTable {
   private int table;
   
   public RegTable() {
      table = 0;
   }
   
   public int newRegister() {
      return table++;
   }
}