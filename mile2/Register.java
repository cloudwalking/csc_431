/**
 * * Represents registers where values will be stored
 * * when not in memory.
 * */
public class Register extends InstrField {
   private Integer num;
   private String color;
   public Register(Integer val) { num = val; color = null; }
   public Integer getValue() { return num; }
   public String toString() { return (color != null) ? color : num.toString(); }
   public boolean equals(Object obj) {
      return (obj instanceof Register) 
         && this.getValue().equals(((Register)obj).getValue());
   }
   public int hashCode() {
      return num.hashCode();
   }
   public void setColor(String color) { this.color = color; }
   public String getColor() { return this.color; }
}
