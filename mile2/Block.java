import java.util.ArrayList;
import java.util.LinkedList;

public class Block {
   private ArrayList<Block> successors;
   private ArrayList<String> labels;
   private int entered, exited, numLabels;

   public Block() {
      successors = new ArrayList<Block>();
      labels = new ArrayList<String>();
      entered = 0;
      exited = 0;
      numLabels = 0;
   }

   public void addNext(Block childBlock) {
      successors.add(childBlock);
   }

   public void addLabel(String blockLabel) {
      labels.add(blockLabel + " " + (numLabels++));
   }

   public String printList(ArrayList<String> asmContents) {
      String retStr = "";
      for (String s: asmContents) {
         retStr += asmContents + ", ";
      }
      return retStr.trim();
   }

   public void printBlock() {
      LinkedList<Block> cfg = new LinkedList<Block>();
      topoPrint(this, 0, cfg, 0);
      cleanTracks(this);
   }

   public void printPadding(int paddingAmt) {
      String padding = "";
      while (paddingAmt-- > 0)
         padding += "   ";
      System.out.print(padding);
   }

   public int topoPrint(Block top, int counter, LinkedList<Block> cfg, int nested) {
      if (top == null || top.entered != 0)
         return counter;
      top.entered = ++counter;
      for (Block b: top.successors) {
         counter = topoPrint(b, counter, cfg, ++nested);
      }
      top.exited = ++counter;
      printPadding(nested);
      System.out.println("Block " + nested + ":");
      printPadding(nested);
      System.out.println("Labels: " + printList(top.labels));
      cfg.addFirst(top);
      return counter;
   }

   public void cleanTracks(Block top) {
      if (top == null || top.entered == 0)
         return;
      top.entered = 0;
      for (Block b: top.successors) {
         cleanTracks(b);
      }
      top.exited = 0;
   }
}
