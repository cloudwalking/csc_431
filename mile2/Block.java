import java.util.LinkedList;

public class Block {
   private LinkedList<Block> successors;
   private LinkedList<Instruction> instrs;
   private LinkedList<String> labels;
   private int entered, exited;
   
   private boolean flag;
   private int depth;

   public Block() {
      successors = new LinkedList<Block>();
      instrs = new LinkedList<Instruction>();
      labels = new LinkedList<String>();
      entered = 0;
      exited = 0;
      
      depth = 0;
      flag = false;
   }

   public Block(String label) {
      this();
      labels.add(label);
   }

   public void addILoc(LinkedList instructions) {
      instrs.addAll(instructions);
   }

   public void addNext(Block childBlock) {
      successors.add(childBlock);
   }

   public void addLabel(String blockLabel) {
      labels.add(blockLabel);
   }
   
   public LinkedList<Instruction> getInstructionList() {
      return this.instrs;
   }
   
   /**
    * Returns true if the label exists on this block.
    */
   public boolean hasLabel(String blockLabel) {
      for(String l : labels) {
         if(l.equals(blockLabel)) {
            return true;
         }
      }
      return false;
   }

   public void reedPrint(int offset) {
      String tabs = "";
      
      // Has this node been seen?
      if(flag && !hasLabel("#function-exit")) {
         return;
      }
      flag = !flag;
      
      for(int i=0; i<offset; i++) tabs += "   ";
      
      if(successors.size() > 1) {
         offset++;
      }
      
      System.out.println(tabs+"BLOCK \""+labels+"\"");
      
      if(hasLabel("#exit")) {
         System.out.println("\n");
         return;
      }
      
      // Print instructions, if we have them
      if(instrs.size() > 0) {
         System.out.println(tabs+"instructions:");
         for(Instruction i : instrs)
            System.out.println(tabs+"   "+i);
      }
      System.out.println(" ");
      
      // Recurse
      for(Block b : successors)
         b.reedPrint(offset);
   }

   public String printInstrs(LinkedList<Instruction> iLoc) {
      String myInstrs = "";
      for (Instruction i : iLoc) {
         myInstrs += "\t" + i.toString() + "\n";
      }
      return myInstrs;
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

   public int topoPrint(Block top, int counter, LinkedList<Block> cfg, int 
nested) {
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
         children += b.labels.toString();
      }
      return children.trim();
   }

   public void printBlockTree(int numBlock, LinkedList<Block> cfg) {
      if (cfg.isEmpty())
         return;
      Block curBlock = cfg.removeFirst();
      System.out.println("Block " + numBlock + ":");
      System.out.println("   labels: " + curBlock.labels.toString());
      System.out.println("   successors are: " + successors(curBlock));
      System.out.println("   contains iloc:\n" + 
printInstrs(curBlock.instrs));
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
