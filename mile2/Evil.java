import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;
import org.antlr.stringtemplate.*;

import java.io.*;
import java.util.Vector;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;

public class Evil
{
   public static void main(String[] args)
   {
      boolean debug = false;
      parseParameters(args);

      CommonTokenStream tokens = new CommonTokenStream(createLexer());
      EvilParser parser = new EvilParser(tokens);
      EvilParser.program_return ret = null;
      
      try
      {
         ret = parser.program();
      }
      catch (org.antlr.runtime.RecognitionException e)
      {
         error(e.toString());
      }

      CommonTree parserRet = (CommonTree)ret.getTree();
      if (_displayAST && parserRet != null)
      {
         DOTTreeGenerator gen = new DOTTreeGenerator();
         StringTemplate st = gen.toDOT(parserRet);
         //System.out.println(st);
      }

      /*
         To create and invoke a tree parser.  Modify with the appropriate
         name of the tree parser and the appropriate start rule.
      */
      try
      {
         //symbolTypes and structTypes contain variables
         //and their types, no values

         CommonTreeNodeStream nodes = new CommonTreeNodeStream(parserRet);
         nodes.setTokenStream(tokens);
         EvilAST tparser = new EvilAST(nodes);

         //tree parser populates the type structures
         StructTable stable = new StructTable();
         FunTable funtable = new FunTable();
         tparser.program(stable, funtable);
         
         if(_displayTypecheck) {
            System.out.println("\n** SymTable **");
            tparser.symtable.print();
            System.out.println("\n** StructTable **");
            tparser.structTable.print();
            System.out.println("\n** FunTable **");
            tparser.funTable.print();
         }

         CommonTreeNodeStream CFGnodes = new
            CommonTreeNodeStream(parserRet);
         CFGnodes.setTokenStream(tokens);
         EvilCFG cfgParser = new EvilCFG(CFGnodes);

         //cfg parser populates the CFG
         LinkedList<Block> blocks;
         RegTable regtable = new RegTable();
         blocks = cfgParser.program(stable, funtable, regtable);
         
         if(_displayTypecheck) {
            System.out.println("\n** RegTable **");
            regtable.print();
         }

         //System.out.println("regtable size: "+regtable.size());
         
         LinkedList<CFG> functions = new LinkedList<CFG>();

         for(Block functionHead : blocks) {
            functions.add(new CFG(functionHead, regtable));
         }
         for(CFG func : functions) {
               //System.out.println("calculating liveout");
            func.calculateLiveOut();
               //System.out.println("calculating interference");
            func.calculateInterference();
            //func.printInterference();
               //System.out.println("calculating color");
            func.makeKey();
               //System.out.println("key size: "+func.getKey().size());
               //System.out.println(func.getKey());
               //System.out.println("coloring");
            if(_color)
            {
               func.color();
            }
            //if you enable spill, see Instruction.java: op == Operator.STOREAI
            func.spill();
         }

         /* Let's optimize. Biggest problem is register pressure
          * 1. Start by making a new key mapping to map each color to
          * a fake register.
          * 2. move through each instruction
          *    - reregister with new key mapping from 1
          *    - clear coloring
          * 3. recolor
          */
         /*
         Hashtable fakeKey = new Hashtable();
         // all the registers from CFG.makeKey() need to MATCH here.
         // Also include all registers from CFG.Crayons.colors();
         fakeKey.put("%g0", 0);
         fakeKey.put("%o0", 1);
         fakeKey.put("%icc", 2);
         fakeKey.put("%g1", 3);
         fakeKey.put("%i0", 4);
         //fakeKey.put("%o0", 1); // two %o0s
         fakeKey.put("%o1", 6);
         fakeKey.put("%o2", 7);
         fakeKey.put("%o3", 8);
         fakeKey.put("%o4", 9);
         fakeKey.put("%i0", 10);
         fakeKey.put("%i1", 11);
         fakeKey.put("%i2", 12);
         fakeKey.put("%i3", 13);
         fakeKey.put("%i4", 14);
         fakeKey.put("%i5", 15);
         fakeKey.put("%l0", 16);
         fakeKey.put("%l1", 17);
         fakeKey.put("%l2", 18);
         fakeKey.put("%l3", 19);
         fakeKey.put("%l4", 20);
         fakeKey.put("%l5", 21);
         fakeKey.put("%l6", 22);
         fakeKey.put("%l7", 23);
         fakeKey.put("%g2", 24);
         fakeKey.put("%g3", 25);


         for(CFG func : functions) {
            if(_color) {
               func.uncolor(fakeKey);
            }
           
            //func.reset(fakeKey.size() + 1);
            func.reset(1000);
            func.calculateLiveOut();
            func.calculateInterference();
            func.makeKey();
            if(_color) {
               func.color(); 
            }
            
         }
         
         */
         
         String fileName = _inputFile;
         boolean print = _displayCFG, printSparc = _displaySparc;
         // Not printing? Turn debug off.
         if(print || printSparc) {
            BufferedWriter codeWriter = null;
            if(!debug) {
               try {
                  String sourceFile = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length());
                  if (printSparc) {
                     //System.out.println("ahh");
                     fileName = fileName.replace(".ev", ".s");
                  } else if (!printSparc) {
                     fileName = fileName.replace(".ev", ".il");
                  }

                  File tmpFile = new File(fileName);
                  tmpFile.createNewFile();
                  //tmpFile.setWritable(true);
                  codeWriter = new BufferedWriter(new FileWriter(tmpFile));
                  if (printSparc) {
                     codeWriter.write("\t" + ".file\t\"" + sourceFile + "\"\n");
                     Block.printSparcConstants(codeWriter);
                  }
               }
               catch (java.io.IOException e) {
                  System.err.println("Error initializing file writer: ");
                  e.printStackTrace();
               }
            }
            for (Block block : blocks) {
               if (debug) {
                  block.reedPrint(0, printSparc);
               }
               else if (!debug) {
                  block.filePrint(codeWriter, printSparc);
               }
            }
            try {
               if (codeWriter != null)
                  codeWriter.close();
            }
            catch (java.io.IOException e) {
               System.err.println("Error closing file writer: ");
               e.printStackTrace();
            }
         }
/*
         for(Block b : blocks) {
            LinkedList<Block> revCFG = b.getTopo();
            LinkedList<LiveEntry> liveSet = revCFG.getFirst().getLiveSet(new LinkedList<LiveEntry>());
           System.out.println("\n"+liveSet);
         }
*/
         if(_displayCFG) {
            for (Block block : blocks) {
               block.reedPrint(0, printSparc);
            }
         }

      }
      catch (org.antlr.runtime.RecognitionException e)
      {
         error(e.toString());
      }
   }

   private static void optimize(LinkedList<CFG> functions) {
      for(CFG func : functions) {

      }
   }

   private static final String DISPLAYAST = "-displayAST";
   private static final String DISPLAYTYPECHECK = "-displayTypecheck";
   private static final String DISPLAYCFG = "-dumpIL";
   private static final String DISPLAYSPARC = "-displaySparc";

   private static final String NOCOLOR = "-noColor";

   private static String _inputFile = null;
   private static boolean _displayAST = false;
   private static boolean _displayTypecheck = false;
   private static boolean _displayCFG = false;
   private static boolean _displaySparc = true;
   
   private static boolean _color = true;

   private static void parseParameters(String [] args)
   {
      for (int i = 0; i < args.length; i++)
      {
         if (args[i].equals(DISPLAYAST))
         {
            _displayAST = true;
         }
         else if (args[i].equals(DISPLAYTYPECHECK))
         {
            _displayTypecheck = true;
         }
         else if (args[i].equals(DISPLAYCFG))
         {
            _displayCFG = true;
         }
         else if (args[i].equals(DISPLAYSPARC))
         {
            _displaySparc = true;
         }
         else if (args[i].equals(NOCOLOR))
         {
            _color = false;
         }
         else if (args[i].charAt(0) == '-')
         {
            System.err.println("unexpected option: " + args[i]);
            System.exit(1);
         }
         else if (_inputFile != null)
        {
            System.err.println("too many files specified");
            System.exit(1);
         }
         else
         {
            _inputFile = args[i];
         }
      }
      if(_displayCFG) {
         System.out.println("display CFG");
            _displaySparc = false;
      }
   }


   private static void error(String msg)
   {
      System.err.println(msg);
      System.exit(1);
   }

   private static EvilLexer createLexer()
   {
      try
      {
         ANTLRInputStream input;
         if (_inputFile == null)
         {
            input = new ANTLRInputStream(System.in);
         }
         else
         {
            input = new ANTLRInputStream(
               new BufferedInputStream(new FileInputStream(_inputFile)));
         }
         return new EvilLexer(input);
      }
      catch (java.io.IOException e)
      {
         System.err.println("file not found: " + _inputFile);
         System.exit(1);
         return null;
      }
   }
}
