import java.util.LinkedList;
import java.util.ArrayList;
import java.util.Stack;
import java.util.Hashtable;
import java.util.Iterator;

public class CFG {
   private Block head;
   private ArrayList<ArrayList<Edge>> interference;
   private Hashtable key;
   private ArrayList<Integer> degrees;
   private Stack<Integer> regStack;
   private RegTable regTable;
   private LinkedList<Integer> spill;
   int size;

   private boolean debug;

   private enum Edge {
      WHOLE_EDGE,
      HALF_EDGE,
      NO_EDGE
   }

   public CFG(Block cfg, RegTable regTable) {
      this.debug = false;
      
      this.head = cfg;
      this.regTable = regTable;
      this.size = regTable.size();
      this.interference = new ArrayList<ArrayList<Edge>>(size);
      this.degrees = new ArrayList<Integer>(size);
      this.regStack = new Stack<Integer>();
      this.key = new Hashtable();
      this.spill = new LinkedList<Integer>();
      
      this.head.finish(); // tells blocks to make gen/kill sets
      
      for(int i=0; i<size; i++) {
         interference.add(new ArrayList<Edge>(size));
         degrees.add(0);
         for(int n=0; n<size; n++) {
            interference.get(i).add(Edge.NO_EDGE);
         }
      }
   }

   // resets gen, kill, liveout
   public void reset(int baseSize) {
      this.size = baseSize + this.countUncoloredRegisters();
      this.interference = new ArrayList<ArrayList<Edge>>(size);
      this.degrees = new ArrayList<Integer>(size);
      this.regStack = new Stack<Integer>();
      this.key = new Hashtable();
      this.spill = new LinkedList<Integer>();
      
      this.head.reset();
      this.head.finish();

      for(int i=0; i<size; i++) {
         interference.add(new ArrayList<Edge>(size));
         degrees.add(0);
         for(int n=0; n<size; n++) {
            interference.get(i).add(Edge.NO_EDGE);
         }
      }
   }

   private int countUncoloredRegisters() {
      int returns = 0;
      for(Block currentBlock : head.getTopo()) {
         for(Instruction instr : currentBlock.getInstructionList()) {
            returns += instr.countUncoloredRegisters();
         }
      }
      return returns;
   }

   /**
    * Gens blocks' liveout set
    */
   public void calculateLiveOut() {
      // 1. reverse topological
      // 2. this block's temp-liveout = union 
      // 3. for each kid
      //    union gen with (liveout - kill)
      // 4. is temp-liveout different than liveout? if so, set a flag to loop again
      //    save temp-liveout as liveout
      // 5. go to next block, do 2-4
    
      boolean loop = true;

      //System.out.println("\ttree forward size: "+head.getTopo().size());
      //System.out.println("\ttree reverse size: "+head.getReverseTopo().size());
      
      while(loop) {
         loop = false;
         // compute liveout for each block
         for (Block currentBlock : head.getReverseTopo()) {
            LinkedList<Register> liveout = new LinkedList<Register>();
            
            if(debug) System.out.println("\tblock "+currentBlock.getLabelList());
            
            for(Block child : currentBlock.getNanny()) {
               LinkedList<Register> tmpLiveout;
               tmpLiveout = union(child.getGen(),
                                  subtract(child.getLiveOut(), child.getKill()));
               liveout = union(liveout, tmpLiveout);
            }
            loop = loop || !compareLists(liveout, currentBlock.getLiveOut());
            currentBlock.setLiveOut(liveout);
         }

      }
   }

   private LinkedList<Register> union(LinkedList<Register> left,
                                      LinkedList<Register> right) {
      LinkedList<Register> returns = new LinkedList<Register>();
      for(Register r : left) {
         if(!returns.contains(r))
            returns.add(r);
      }
      for(Register r : right) {
         if(!returns.contains(r))
            returns.add(r);
      }

      return returns;
   }

   private LinkedList<Register> subtract(LinkedList<Register> left,
                                         LinkedList<Register> right) {
      LinkedList<Register> returns = new LinkedList<Register>();
      for(Register r : left) {
         if(!right.contains(r) && !returns.contains(r))
            returns.add(r);
      }

      return returns;
   }
   
   /**
    * Returns true if the two lists contain the same registers.
    * Order is irrelevant.
    */
   private boolean compareLists(LinkedList<Register> left,
                                LinkedList<Register> right) {
     boolean returns = true;
     for(Register r : left) {
        if(!right.contains(r)) {
           returns = false;
           break;
        }
     }
     return left.size() == right.size() && returns;
   }

   public void calculateInterference() {
      // 1. start at top block
      // 2. start at last instruction
      // 3. for each instruction
      //    -in interference, draw edge from instr's target to each liveNow
      //    -remove all instr's targets from liveNow
      //    -add all instr's sources to liveNow
      // 4. do 2-3 for each block
      
      
      for(Block currentBlock : head.getTopo()) {
//System.out.println(currentBlock.getLabelList());
         if(debug) System.out.print("\tblock "+currentBlock.getLabelList());
         LinkedList<Instruction> instrs = currentBlock.getInstructionList();
         if(debug) System.out.println(" "+instrs.size()+" instructions");
         if(debug) System.out.println("\tliveout: "+currentBlock.getLiveOut());
         for(Iterator<Instruction>iter=instrs.descendingIterator(); iter.hasNext();){
            Instruction i = iter.next();
            
            if(debug)System.out.println("\t\t"+i);
//System.out.println(i+"\ts"+ i.getSourceRegisterList()+" d"+i.getDestinationRegister());
            for(Register r : currentBlock.getLiveOut()) {
               if(i.getDestinationRegister() != null) {
                  int dest = i.getDestinationRegister().getValue().intValue();
                  int collision = r.getValue().intValue();
                  
                  interference.get(dest).set(
                     collision, Edge.WHOLE_EDGE);
                  interference.get(collision).set(
                     dest, Edge.WHOLE_EDGE);
                  degrees.set(dest, degrees.get(dest)+1);
               }
            }
            
            currentBlock.getLiveOut().remove(i.getDestinationRegister());
            for(Register r : i.getSourceRegisterList()) {
               if(!currentBlock.getLiveOut().contains(r))
                  currentBlock.getLiveOut().add(r);
            }
         }
      }

      //Ignore the special registers
      for (Integer i : regTable.getSpecialRegisters()) {
         //if(debug) System.out.println("Register "+i+" is special and gets no edge.");
         for(int k=0; k < size; k++) {
            interference.get(i).set(k, Edge.NO_EDGE);
         }
      }
   }
   
   public void printInterference() {
      int i = 0;
      
      System.out.print("   ");
      for(int x = 0; x < size; x++) {
         if(x < 10)
            System.out.print("0");
         System.out.print(x+" ");
      }
      System.out.print("\n");
      
      for(ArrayList<Edge> row : interference) {
         if(i < 10)
            System.out.print("0");
         System.out.print((i++)+" ");
         for(Edge e : row) {
            if(e != Edge.NO_EDGE)
               System.out.print("*  ");
            else
               System.out.print("   ");
         }
         System.out.print("\n");
      }
   }
   
   /**
    * Returns a hashmap associating register # to color.
    */
   public void makeKey() {
      Crayons crayons = new Crayons();
      LinkedList<Integer> constrained = new LinkedList<Integer>(degrees);
      LinkedList<Integer> pushOrder = new LinkedList<Integer>();
      int largest;
      int location;
      int val;
      
      // pushOrder gets registers in order of degree, desc
      for(int i=0; i<size; i++) {
         largest = -1;
         location = -1;
         for(int n=0; n<size; n++) {
            val = constrained.get(n).intValue();
            if(val > largest) {
               largest = val;
               location = n;
            }
         }
         pushOrder.add(location);
         constrained.set(location, -1);
         for(Edge e : interference.get(location)) {
            if(e == Edge.WHOLE_EDGE) e = Edge.HALF_EDGE;
         }
      }
      
      for(Integer x : pushOrder) {
         int i = x.intValue();
         regStack.push(i);
      }
      
      //if(debug) System.out.println("pushOrder (desc?): "+pushOrder);
      //if(debug) System.out.println("regStack: "+regStack);

      int register, tries;
      boolean bad;
      while(!regStack.empty()) {
         bad = true;
         tries = 0;

         // get the register from the stack
         register = regStack.pop().intValue();

         /* insert it back into the graph... */
         
         // preview the next color
         String peakedColor = crayons.peak();
         
         // see if the preview color is valid:
         // loop through all the nodes this one touches
         // if one has the same color, get a new color and start over
         // only try (# colors) times
         while(tries++ < crayons.count() && bad) {
            bad = false;
            for(int i=0; i<size; i++) { // for each adjacent node
               if(interference.get(register).get(i) == Edge.WHOLE_EDGE &&
                     i != register && // just to be sane
                     key.get(i) != null &&
                     key.get(i).equals(peakedColor)) {
                  bad = true;
                  crayons.nextColor();
                  peakedColor = crayons.peak();
                  break;
               }
            }
            if(!bad) {
               key.put(register, crayons.nextColor());
               for(int i=0; i<size; i++) {
                  // Connect the nodes now that it's colored and back in
                  if(interference.get(register).get(i) == Edge.HALF_EDGE)
                     interference.get(register).set(i, Edge.WHOLE_EDGE);
               }
            }
         }
         if(tries == crayons.count() || bad) {
           if(debug) System.out.println("Register "+ register +" is causing spill");
            
            /* Take it out of the queue */
            int spillThis;
            
            // don't spill special registers.
            /*
            do {
               spillThis = pushOrder.removeFirst();
            } while(regTable.getSpecialRegisters().contains(spillThis));
            
            spill.add(spillThis);
            
            if(debug) System.out.println("Spilling reg "+spillThis);
            //if(debug) System.out.println("Spilling reg "+register);

            // Unconnect from the graph
            for(int i=0; i<size; i++) {
               if(interference.get(spillThis).get(i) == Edge.WHOLE_EDGE)
                  interference.get(spillThis).set(i, Edge.HALF_EDGE);
            }
            
            regStack.clear();
            // Now we need to start coloring over.
            for(Integer x : pushOrder) {
               int i = x.intValue();
               regStack.push(i);
            }

            //if(debug) System.out.println("regStack now: "+regStack);
            */
            //if(debug) System.out.println("remove register "+register);
            //if(debug) System.out.println("push order before removal: "+pushOrder);
            
            // We're lazy, so let's just spill this PITA register.
            spill.add(new Integer(register));
            pushOrder.remove(new Integer(register));
            //if(debug) System.out.println("push order after removal: "+pushOrder);

            // Unconnect from graph
            for(int i=0; i<size; i++) {
               if(interference.get(new Integer(register)).get(i) == Edge.WHOLE_EDGE)
                  interference.get(new Integer(register)).set(i, Edge.HALF_EDGE);
            }

            // start coloring over
            regStack.clear();
            for(Integer x : pushOrder) {
               regStack.push(x.intValue());
            }
         }

         crayons.reset();
      }
      
      key.put(0, "%g0");
      key.put(1, "%o0");
      key.put(2, "%icc");
      key.put(3, "%g1");
      key.put(4, "%i0");
      key.put(5, "%o0");
      key.put(6, "%o1");
      key.put(7, "%o2");
      key.put(8, "%o3");
      key.put(9, "%o4");
      // took out %o5 to use in read
      // need to match this with RegTable.java reg list.
      //key.put(10, "%o5");
      key.put(10, "%i0");
      key.put(11, "%i1");
      key.put(12, "%i2");
      key.put(13, "%i3");
      key.put(14, "%i4");
      key.put(15, "%i5");

      if(debug) System.out.println("Spill list: "+spill);

      //return key;
   }

   public void spill() {
      // Map each spilled register to a location
      Hashtable memoryMapping = new Hashtable();
      int offset = 128; // arbitrary location on the stack. this is where spills are held.
      for(Integer i : this.spill) {
         memoryMapping.put(i, offset);
         offset += 16;
      }
      
      for(Block currentBlock : head.getTopo()) {
         if(debug) System.out.println("block "+currentBlock.labels());
         // arbitrary locations on the stack
         int destinationSave = 16;
         int sourceSave = 24; // this will get +16 when used, then reset at next block

         int instructionCount = currentBlock.getInstructionList().size();
         for(int i=0; i<instructionCount; i++) {
            Instruction currentInstr = currentBlock.getInstructionList().get(i);
           
            //if(debug) System.out.println("\t\t\tspill pls: "+spill);
            //if(debug) System.out.println("\t\t\tsources: "+currentInstr.getSourceRegisterList());
            //if(debug) System.out.println("\t\t\tdest: "+currentInstr.getDestinationRegister());

            boolean needSpill = false;
            for(Register r : currentInstr.getSourceRegisterList()) {
               if(this.spill.contains(r.getValue())) {
                  needSpill = true;
                  break;
               }
            }
            if(currentInstr.getDestinationRegister() != null &&
               this.spill.contains(currentInstr.getDestinationRegister().getValue())) {
               needSpill = true;
            }
            
            if(debug) System.out.println("\t"+currentInstr);

            if(needSpill) { 
               if(debug) System.out.println("\t\tspill!");

               // See what colors are already used in this instr 
               ArrayList<String> usedColors = new ArrayList<String>();
               if(currentInstr.getDestinationRegister() != null && 
                  currentInstr.getDestinationRegister().getColor() != null) {
                  usedColors.add(currentInstr.getDestinationRegister().getColor());
               }
               for(Register r : currentInstr.getSourceRegisterList()) {
                  if(r.getColor() != null) {
                     usedColors.add(r.getColor());
                  }
               }
               // List valid colors
               ArrayList<String> validColors = new ArrayList<String>();
               for(String color : Crayons.colors()){
                  if(!usedColors.contains(color)) {
                     validColors.add(color);
                  }
               }

               
               /* Now add the instructions. */
               ArrayList<Instruction> beforeInstructions = new ArrayList<Instruction>();
               ArrayList<Instruction> afterInstructions = new ArrayList<Instruction>();
               
               // destination register needs to spill
               if(currentInstr.getDestinationRegister() != null &&
                  this.spill.contains(currentInstr.getDestinationRegister().getValue())) {
                  
                  if(debug) System.out.println("spill destination register "+currentInstr.getDestinationRegister());
                  if(debug) System.out.println("\tinstruction: "+currentInstr);
                  
                  String overrideRegister = validColors.remove(0);
                  // save current colored register
                  Instruction newInst = new Instruction("STAI", 
                                                         new Register(new Integer(999), overrideRegister),
                                                         new Register(new Integer(999), "%sp"),
                                                         destinationSave);
               //if(debug) System.out.println("\tinstr: "+newInst.toSparc());
                  //currentBlock.getInstructionList().add(i++, newInst);
                  beforeInstructions.add(newInst);
               //if(debug) System.out.println("\told instr: "+currentBlock.getInstructionList().get(i).toSparc());
                  currentInstr.getDestinationRegister().setColor(overrideRegister);
              
                  
                  if(debug) System.out.println("\tinstructi*n: "+currentInstr);
                  /* -old instruction happens w/ color */
                  
                  Integer destReg = (Integer)memoryMapping.get(currentInstr.getDestinationRegister().getValue());
                  newInst = new Instruction("STAI",
                                             new Register(new Integer(999), overrideRegister),
                                             new Register(new Integer(999), "%sp"),
                                             destReg.intValue());
                  afterInstructions.add(newInst);
                  newInst = new Instruction("LOADAI",
                                             new Register(new Integer(999), "%sp"),
                                             destinationSave,
                                             new Register(new Integer(999), overrideRegister));
               //if(debug) System.out.println("\tinstr: "+newInst.toSparc());
                  //currentBlock.getInstructionList().add(++i, newInst);
                  afterInstructions.add(newInst);
               }

               
               // source registers need to spill
               for(Register r : currentInstr.getSourceRegisterList()) {
                  if(this.spill.contains(r.getValue())) {
                     
                     if(debug) System.out.println("source spill reg "+r);
                     if(debug) System.out.println("\tinstruction: "+currentInstr);
                     
                     
                     String overrideRegister = validColors.remove(0);
                     // save current colored register
                     Instruction newInst = new Instruction("STAI", 
                                                            new Register(new Integer(999), overrideRegister),
                                                            new Register(new Integer(999), "%sp"),
                                                            sourceSave);
                     beforeInstructions.add(newInst);
                    

                     Integer sourceOffset = (Integer)memoryMapping.get(r.getValue());

                     newInst = new Instruction("LOADAI",
                                                new Register(new Integer(999), "%sp"),
                                                sourceOffset.intValue(),
                                                new Register(new Integer(999), overrideRegister));
                     beforeInstructions.add(newInst);
                     
                     /* -old instruction happens w/ color */
                     r.setColor(overrideRegister);
                  
                     if(debug) System.out.println("\tinstructi*n: "+currentInstr);
                  
                     // Need to add the after instructions BEFORE the other finishing instructions
                     LinkedList<Instruction> tempInstructionList = new LinkedList<Instruction>();
                     
                     newInst = new Instruction("STAI",
                                                new Register(new Integer(999), overrideRegister),
                                                new Register(new Integer(999), "%sp"),
                                                sourceOffset.intValue());
                     tempInstructionList.add(newInst);
                     
                     newInst = new Instruction("LOADAI",
                                                new Register(new Integer(999), "%sp"),
                                                sourceSave,
                                                new Register(new Integer(999), overrideRegister));
                     tempInstructionList.add(newInst);

                     sourceSave += 16;

                     // Add the after instructions to the beginning. This should nest properly...
                     afterInstructions.addAll(0, tempInstructionList);
                  }
               }

               if(debug) {
                  System.out.println("adding before:");
                  for(Instruction x : beforeInstructions)
                     System.out.println(x);
                  System.out.println("current instr:");
                  System.out.println(currentBlock.getInstructionList().get(i));
                  System.out.println("adding after:");
                  for(Instruction x : afterInstructions)
                     System.out.println(x);
               }

               for(int add=0; add<beforeInstructions.size(); add++) {
                  currentBlock.getInstructionList().add(i++, beforeInstructions.get(add));
                  instructionCount++;
               }
               i++; // skip "real" instruction (the one with the spills)
               instructionCount++;
               for(int add=0; add<afterInstructions.size(); add++) {
                  currentBlock.getInstructionList().add(i++, afterInstructions.get(add));
                  instructionCount++;
               }
               i--; // the for loop will push it past this last instr.
               instructionCount--;
            }
         }
      }
   }
   
   public void color() {
      head.reregister(key);
   }
   
   // translates the colored instructions back to uncolored ones
   // for optimization reasons.
   public void uncolor(Hashtable key) {
      head.uncolor(key);
   }
   
   public Hashtable getKey() {
      return this.key;
   }
   
   public LinkedList<Integer> getSpills() {
      return this.spill;
   }
   
   
}
