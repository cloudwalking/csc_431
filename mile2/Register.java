/**
 * * Represents registers where values will be stored
 * * when not in memory.
 * */
public class Register extends InstrField {
   private Integer num;
   public Register(Integer val) { num = val; }
   public Integer getValue() { return num; }
   public String toString() { return num.toString(); }
   public boolean equals(Object obj) {
      return (obj instanceof Register) && this.getValue().equals(((Register)obj).getValue());
   }
   public int hashCode() {
      // 31 is prime
      return 31 + num.hashCode();
   }
}
