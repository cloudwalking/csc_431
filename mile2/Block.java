import java.util.ArrayList;

public class Block {
   private ArrayList<Block> successors = new ArrayList<Block>();
   private ArrayList<String> instrs, labels;
   private int entered, exited;

   public Block() {
      successors = new ArrayList<Block>();
      instrs = new ArrayList<String>();
      labels = new ArrayList<String>();
   }

   public void addNext(Block childBlock) {
      successors.add(childBlock);
   }

   public void addILoc(String ilocInstr) {
      instrs.add(ilocInstr);
   }

   public void setLabel(String blockLabel) {
      labels.add(blockLabel);
   }

   public String printList(ArrayList<Block> children) {
      String childString = "";
   }

   public String printList(ArrayList<String> asmContents) {
      String retStr = "";
      for (String s: asmContents) {
         retStr += asmContents + ", ";
      }
      return retStr.trim();
   }

   public void printBlock() {
      topoPrint(this, 0);
      printBlockTree(0);
   }

   public void printPadding(int paddingAmt) {
      String padding = "";
      while (paddingAmt-- > 0)
         padding += "   ";
      System.out.print(padding);
   }

   public void topoPrint(Block top, int counter) {
      top.entered = counter++;
      printPadding(numIter);
      System.out.println("Block " + numIter + ":");
      if (top.successors.isEmpty()) {
         
      }
   }

   public void printBlockTree(int numIter) {
      printPadding(numIter);
      System.out.println("Block " + numIter + ":");
      printPadding(numIter);
      System.out.println("Labels: " + printList(labels));
      printPadding(numIter);
      System.out.println("ILOC: " + printList(instrs));
      for (Block b: successors) {
         numIter++;
         printPadding(numIter);
         System.out.println("Block " + numIter + ":");
         printPadding(numIter);
         System.out.println("Labels: " + printList(labels));
         printPadding(numIter);
         System.out.println("ILOC: " + printList(instrs));
      }
   }
}
