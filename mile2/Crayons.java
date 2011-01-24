import java.util.ArrayList;
import java.util.Arrays;
public class Crayons {
   static String[] colors = {"%l0", "%l1", "%l2", "%l3", 
                      "%l4", "%l5", "%l6", "%l7",
                      "%g2", "%g3",  //"%i2", "%i3", "%i4", "%i5"
                     };
   int next;
   public Crayons() {
      next = 0;
   }
   public String nextColor() {
      bound();
      return colors[(next++)];
   }
   public String peak() {
      bound();
      return colors[next];
   }
   public String getSpill() {
      return "SPILL";
   }
   public int count() {
      return colors.length;
   }
   public static ArrayList<String>colors() {
      return new ArrayList<String>(Arrays.asList(colors));
   }
   
   public void bound() {
      if(next >= colors.length) next = 0;
   }

   public void reset() {
      next = 0;
   }
}
