import java.util.ArrayList;
import java.util.LinkedList;

public class Block {
   private ArrayList<Block> successors;
   private LinkedList<Instruction> instrs;
   private ArrayList<String> labels;
   private int entered, exited;

   public Block() {
      successors = new ArrayList<Block>();
      instrs = new LinkedList<Instruction>();
      labels = new ArrayList<String>();
      entered = 0;
      exited = 0;
   }

   public void addILoc(LinkedList instructions) {
System.out.println("Hello new instruction ;D " + instructions.toString());
      instrs.addAll(instructions);
   }

   public void addNext(Block childBlock) {
      successors.add(childBlock);
   }

   public void addLabel(String blockLabel) {
      labels.add(blockLabel);
   }

   public String printInstrs(LinkedList<Instruction> iLoc) {
      String myInstrs = "";
      for (Instruction i : iLoc) {
         myInstrs += i.toString() + "\n";
      }
      return myInstrs.trim();
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
      printBlockTree(0, cfg);
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
      cfg.addFirst(top);
      return counter;
   }

   public String successors(Block head) {
      String children = "";
      for (Block b: head.successors) {
         children += printList(b.labels);
      }
      return children.trim();
   }

   public void printBlockTree(int numBlock, LinkedList<Block> cfg) {
      if (cfg.isEmpty())
         return;
      Block curBlock = cfg.removeFirst();
      System.out.println("Block " + numBlock + ":");
      System.out.println("   labels: " + printList(curBlock.labels));
      System.out.println("   successors are: " + successors(curBlock));
      System.out.println("   contains iloc: " + printInstrs(instrs));
      printBlockTree(++numBlock, cfg);
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
