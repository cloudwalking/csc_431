import java.util.LinkedList;
import java.util.ArrayList;
import java.util.Stack;

public class CFG {
   private Block head;
   private ArrayList<ArrayList<Edge>> interference;
   private ArrayList<Integer> degrees;
   private Stack<Register> regStack;
   private RegTable regTable;
   int size;

   private enum Edge {
      WHOLE_EDGE,
      HALF_EDGE,
      NO_EDGE
   }

   public CFG(RegTable regTable) {
      this.regTable = regTable;
      size = regTable.size();
      interference = new ArrayList<ArrayList<Edge>>(size);
      for(int i=0; i<size; i++) {
         interference.get(i) = new ArrayList<Edge>(size);
         for(int n=0; n<size; n++) {
            interference.get(i).get(n) = NO_EDGE;
         }
      }
      degrees = new ArrayList<Integer>(size);
      regStack = new Stack<Register>();
   }

   /**
    * Gen's blocks' liveout set
    */
   public void calculateLiveOut() {
      // 1. reverse topological <--
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
                                  subtract(child.getLiveOut, child.getKill));
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

   /**
    * will return matrix
    */
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
         for(Instruction i : instrs.descendingIterator()) {
            for(Register r : i.getLiveOut()) {
               if(i.getDestinationRegister().equals(r)) {
                  int dest = i.getDestinationRegister().intValue();
                  interference.get(dest).get(r.intValue()) = WHOLE_EDGE;
                  if(degrees.get(dest) == null) degrees.get(dest) = 0;
                  degrees.set(dest, ++degrees.get(dest));
               }
            }
            currentBlock.getLiveOut().remove(i.getDestinationRegister());
            for(Register r : i.getSourceRegisterList()) {
               currentBlock.getLiveOut.add(r);
            }
         }
      }
   }
   
   /**
    * will return matrix
    */
   public void color() {
      // get most constrained
      LinkedList<Integer> constrained = new LinkedList<Integer>(degrees);
      LinkedList<Integer> pushOrder = new LinkedList<Integer>();
      int largest;
      int location;
      int val;
      
      // push gets registers in order of degree, desc
      for(int i=0; i<size; i++) {
         largest = -1;
         location = -1;
         for(int n=0; n<size; n++) {
            val = constrained.get(n);
            if(val > largest) {
               largest = val;
               location = n;
            }
         }
         pushOrder.add(location);
         constrained.set(location, -1);
      }
      
      for(Integer x : pushOrder) {
         int i = x.intValue();
         regStack.push(
      }
   }

}
