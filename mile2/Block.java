import java.util.LinkedList;
import java.io.BufferedWriter;

public class Block {
   private LinkedList<Block> successors;
   private LinkedList<Block> predecessors;
   private LinkedList<Instruction> instrs;
   private LinkedList<String> labels;
   private LinkedList<Register> gen;
   private LinkedList<Register> kill;
   private LinkedList<Register> liveout;
   private int entered, exited;
  
   private boolean flag;
   private int depth;

   public Block() {
      successors = new LinkedList<Block>();
      predecessors = new LinkedList<Block>();
      instrs = new LinkedList<Instruction>();
      labels = new LinkedList<String>();
      entered = 0;
      exited = 0;
      
      depth = 0;
      flag = false;
   }

   public String toString() {
      return instrs.toString();
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

   public void addPrevious(Block parentBlock) {
      predecessors.add(parentBlock);
   }
   
   public void setNext(LinkedList<Block> newKids) {
      this.successors = newKids;//on the block
   }

   public void addLabel(String blockLabel) {
      labels.add(blockLabel);
   }

   public void addLabels(LinkedList<String> newLabels) {
      labels.addAll(0, newLabels);
   }
   
   public LinkedList<Instruction> getInstructionList() {
      return this.instrs;
   }
   
   public LinkedList<String> getLabelList() {
      return this.labels;
   }
/*
   private class LiveEntry {
      public Register reg;
      public Instruction instr;

      public int hashCode() {
         // 31 is prime
         return 31 + reg.hashCode();
      }

      public String toString() {
         return reg + "";
      }
   }
  */ 
   public LinkedList<LiveEntry> getLiveSet(LinkedList<LiveEntry> parentOut) {
      LinkedList<LiveEntry> gen = new LinkedList<LiveEntry>();
      LinkedList<LiveEntry> kill = new LinkedList<LiveEntry>();
      LinkedList<LiveEntry> out = new LinkedList<LiveEntry>();
      LinkedList<Instruction> backwards = new LinkedList<Instruction>();


      for(Block b : predecessors) {
         for(LiveEntry e : b.getLiveSet(new LinkedList<LiveEntry>())) {
            if(!parentOut.contains(e)) {
               parentOut.add(e);
            }
         }
      }

      for(Instruction i : instrs) {
//         backwards.addFirst(i);
           backwards.add(i); // Not actually backwards
      }

      for(Instruction i : backwards) {
         if(i.getSourceRegisterList().size() != 0) {
            for(Register r : i.getSourceRegisterList()) {
               LiveEntry tmpEntry = new LiveEntry();
               tmpEntry.instr = i;
               tmpEntry.reg = r;
               if(!kill.contains(tmpEntry) && !gen.contains(tmpEntry)) {
                  gen.add(tmpEntry);
               }
            }
         }
         
         LiveEntry tmpEntry= new LiveEntry();
         tmpEntry.instr = i;
         tmpEntry.reg = i.getDestinationRegister();
         if(null != i.getDestinationRegister() && !kill.contains(tmpEntry)) {
            //gen.add(tmpEntry);
            kill.add(tmpEntry);
         }
      }

      for(LiveEntry l : parentOut) {
         if(!kill.contains(l)) {
            out.add(l);
         }
      }

      for(LiveEntry l : gen) {
         out.add(l);
      }
      
      
      System.out.println("gen : " + gen);
      System.out.println("kill: " + kill);
      
       
      return out;
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

   public static void printSparcConstants(BufferedWriter writer) {
      try {
         String evilPrint, evilPrintln, evilRead, tab, align, section;
         String printLabel, printLnLabel, readLabel, readOnly, constString;

         tab = "\t";
         //tells the linker what this section will contain
         section = ".section";
         //represents a static string
         constString = ".asciz";
         align = ".align";
         //represents a readonly section
         readOnly = "\".rodata\"";

         evilPrint = "\"%d \"";
         evilPrintln = "\"%d\\n\"";
         evilRead = "\"%d\"";

         printLabel = ".EV1LPR";
         printLnLabel = ".EV1LPRL";
         readLabel = ".EV1LRD";

         writer.write(tab + section + tab + readOnly + "\n");
         writer.write(tab + align + tab + "8\n");

         writer.write(printLabel + "\n");
         writer.write(tab + constString + tab + evilPrint + "\n");
         writer.write(tab + align + tab + "8\n");

         writer.write(printLnLabel + "\n");
         writer.write(tab + constString + tab + evilPrintln + "\n");
         writer.write(tab + align + tab + "8\n");

         writer.write(readLabel + "\n");
         writer.write(tab + constString + tab + evilRead + "\n");
         writer.write(tab + align + tab + "8\n");
      }
      catch (java.io.IOException e) {
         System.err.println("error writing sparc constants");
      }
   }

   private void printSparcHeader(BufferedWriter writer, String funName) {
      try { 
         String section, align, global, type, functionType;
         String proc, exeText, tab;

         //general pseudo operations for preparing a function
         tab = "\t";
         //tells the linker what this section will contain
         section = ".section";
         align = ".align";
         global = ".global";
         type = ".type";
         proc = ".proc";
         //represents a section of executable text
         exeText = "\".text\"";

         functionType = "#function";


         writer.write(tab + section + tab + exeText + "\n");
         writer.write(tab + align + tab + "4\n");
         writer.write(tab + global + tab + funName + "\n");
         writer.write(tab + type + tab + funName + ", " + functionType + "\n");
         writer.write(tab + proc + tab + "04\n");
      }
      catch (java.io.IOException e) {
         System.err.println("error writing sparc header");
         e.printStackTrace();
      }
   }

   public void filePrint(BufferedWriter writer, boolean toSparc) {
      try {
         // Has this node been seen?
         if (toSparc) {
            for (String s: labels) {
               if (!s.startsWith(".") && !s.startsWith("#")) {
                   printSparcHeader(writer, s);
               }
            }
         }
         if(flag && !hasLabel("#function-exit")) {
            return;
         }
         flag = !flag;
      
         for (String s: labels) {
            writer.write(s.replace("[", " ").replace("]", "\t") + ":\n");
            //System.out.println(s.replace("[", " ").replace("]", "\t"));
         }
      
         if(hasLabel("#exit")) {
            writer.write("\n");
            return;
         }
      
         // Print instructions, if we have them
         if(instrs.size() > 0) {
            for(Instruction i : instrs) {
               if (toSparc) {
                  String tmpSparc = i.toSparc().replace("[", " ").replace("]", "\t");
                  //System.out.println("sparc instr to be written: " + tmpSparc);
                  writer.write("\t" + tmpSparc + "\n");
                  //System.out.println("\t" + tmpSparc);
               }
               else {
                  String tmpInstr = i.toString().replace("[", " ").replace("]", "\t");
                  writer.write("\t" + tmpInstr + "\n");
                  //System.out.println("\t" + tmpInstr);
               }
            }
         }
         writer.write(" ");
      
         // Recurse
         for(Block b : successors)
            b.filePrint(writer, toSparc);
      }
      catch (java.io.IOException e) {
         System.err.println("Error printing to file");
      }
   }

   public boolean reservedBlock() {
      for(String l : labels) {
         if(l.charAt(0) == '#') {
            return true;
         }
      }
      return false;
   }
   
   public Block getFirstChild() {
      return successors.get(0);
   }
   
   public LinkedList<Block> getNanny() {
      return successors;
   }

   public void reedPrint(int offset, boolean toSparc) {
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
         for(Instruction i : instrs) {
            if (toSparc)
               System.out.println(tabs+"   "+i.toSparc());
            else
               System.out.println(tabs+"   "+i);
         }
      }
      System.out.println(" ");
      
      // Recurse
      for(Block b : successors)
         b.reedPrint(offset, toSparc);
   }

   public String printInstrs(LinkedList<Instruction> iLoc) {
      String myInstrs = "";
      for (Instruction i : iLoc) {
         myInstrs += "\t" + i.toString() + "\n";
         myInstrs.replace("[", " ");
         myInstrs.replace("]", " ");
      }
      return myInstrs;
   }

   public LinkedList<Block> getTopo() {
      LinkedList<Block> cfg = new LinkedList<Block>();
      topo(this, 0, cfg);
      cleanTracks(this);
      return cfg;
   }

   public LinkedList<Block> getReverseTopo() {
      LinkedList<Block> cfg = new LinkedList<Block>();
      reverseTopoPrint(this, 0, cfg);
      cleanTracks(this);
      return cfg;
   }

   public void printPadding(int paddingAmt) {
      String padding = "";
      while (paddingAmt-- > 0)
         padding += "   ";
      System.out.print(padding);
   }

   public int topo(Block top, int counter, LinkedList<Block> cfg) {
      if (top == null || top.entered != 0)
         return counter;
      top.entered = ++counter;
      for (Block b: top.successors) {
         counter = topo(b, counter, cfg);
      }
      top.exited = ++counter;
      cfg.addLast(top);
      return counter;
   }

   public int reverseTopoPrint(Block bottom, int counter, LinkedList<Block> cfg) {
      if (bottom == null || bottom.entered != 0)
         return counter;
      bottom.entered = ++counter;
      for (Block b: bottom.predecessors) {
         counter = reverseTopoPrint(b, counter, cfg);
      }
      bottom.exited = ++counter;
      cfg.addFirst(bottom);
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
      System.out.println("   contains iloc:\n" + printInstrs(curBlock.instrs));
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




   public void createGenKill() {
      LinkedList<Instruction> backwards = new LinkedList<Instruction>();
      
      for(Instruction i : instrs) {
         //backwards.addFirst(i);
         backwards.add(i);
      }

      for(Instruction i : backwards) {
	      for(Register r : i.getSourceRegisterList()) {
		      if(!kill.contains(r) && !gen.contains(r)) {
			      gen.add(r);
		      }
	      }

         Register target = i.getDestinationRegister();
         if(!kill.contains(target))
            kill.add(target);
      }
   }

   public LinkedList<Register> getGen() {
      return gen;
   }

   public LinkedList<Register> getKill() {
      return kill;
   }

   public LinkedList<Register> getLiveOut() {
      return liveout;
   }

   public void setLiveOut(LinkedList<Register> newLiveOut) {
      this.liveout = newLiveOut;
   }
}
