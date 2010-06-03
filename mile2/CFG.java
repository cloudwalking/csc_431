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
   int size;

   private enum Edge {
      WHOLE_EDGE,
      HALF_EDGE,
      NO_EDGE
   }

   public CFG(Block cfg, RegTable regTable) {
      this.head = cfg;
      this.regTable = regTable;
      this.size = regTable.size();
      this.interference = new ArrayList<ArrayList<Edge>>(size);
      this.degrees = new ArrayList<Integer>(size);
      this.regStack = new Stack<Integer>();
      this.key = new Hashtable();
      
      for(int i=0; i<size; i++) {
         interference.add(new ArrayList<Edge>(size));
         degrees.add(0);
         for(int n=0; n<size; n++) {
            interference.get(i).add(Edge.NO_EDGE);
         }
      }
   }

   /**
    * Gen's blocks' liveout set
    */
   public void calculateLiveOut() {
      // 1. reverse topological
      // 2. this block's temp-liveout = union 
      // 3. for each kid
      //    union gen with (liveout - kill)
      // 4. is temp-liveout different than liveout? if so, set a flag to loop again
      //    save temp-liveout as liveout
      // 5. go to next block, do 2-4
    
      LinkedList<Register> liveout = new LinkedList<Register>();
      boolean loop = true;

      
      while(loop) {
         loop = false;
         // compute liveout for block
         for (Block currentBlock : head.getReverseTopo()) {
            for(Block child : currentBlock.getNanny()) {
               LinkedList<Register> tmpLiveout;
               tmpLiveout = union(child.getGen(),
                                  subtract(child.getLiveOut(), child.getKill()));
               liveout = union(liveout, tmpLiveout);
            }
            loop = loop || !compareLists(liveout, currentBlock.getLiveOut());
            currentBlock.setLiveOut(liveout);
            // ===
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
         if(!right.contains(r))
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
      //    -in interference, draw edge from instructions target to each liveNow
      //    -remove all instr's targets from liveNow
      //    -add all instr's sources to liveNow
      // 4. do 2-3 for each block
      
      
      for(Block currentBlock : head.getTopo()) {
         LinkedList<Instruction> instrs = currentBlock.getInstructionList();
         for(Iterator<Instruction>iter=instrs.descendingIterator(); iter.hasNext();){
            Instruction i = iter.next();
         //for(Instruction i : instrs.descendingIterator()) {
            for(Register r : currentBlock.getLiveOut()) {
               if(i.getDestinationRegister().equals(r)) {
                  int dest = i.getDestinationRegister().getValue().intValue();
                  interference.get(dest).set(
                     r.getValue().intValue(), Edge.WHOLE_EDGE);
                  degrees.set(dest, degrees.get(dest)+1);
               }
            }
            currentBlock.getLiveOut().remove(i.getDestinationRegister());
            for(Register r : i.getSourceRegisterList()) {
               currentBlock.getLiveOut().add(r);
            }
         }
      }
   }
   
   /**
    * Returns a hashmap associating register # to color.
    */
   public void color() {
      // get most constrained
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
      
      // Get off my lawn.
      for(Integer x : pushOrder) {
         int i = x.intValue();
         regStack.push(i);
      }
      
      int register;
      boolean bad;
      int tries;
      while(!regStack.empty()) {
         bad = true;
         tries = 0;

         // get the register from the stack
         register = regStack.pop().intValue();

         // insert it back into the graph...

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
                     key.get(i).equals(peakedColor)) {
                  bad = true;
                  crayons.nextColor();
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
         if(tries == crayons.count() && bad) {
            // Spill
         }
      }
      
      head.reregister(key);

      //return key;
   }
   
   public Hashtable getKey() {
      return this.key;
   }
   
   private class Crayons {
      String[] colors = {"elephant", "whale", "octopus", "dog", 
                         "lizard", "bird", "seal", "bear" };
      int next;
      public Crayons() {
         next = 0;
      }
      public String nextColor() {
         bound();
         return colors[next++];
      }
      public String peak() {
         bound();
         return colors[next];
      }
      public int count() {
         return colors.length;
      }
      private void bound() {
         if(next >= colors.length) next = 0;
      }
   }
}
