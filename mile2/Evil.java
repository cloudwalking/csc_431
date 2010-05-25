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
      boolean debug = true;
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
         System.out.println(st);
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

         CommonTreeNodeStream CFGnodes = new CommonTreeNodeStream(parserRet);
         CFGnodes.setTokenStream(tokens);
         EvilCFG cfgParser = new EvilCFG(CFGnodes);

         //cfg parser populates the CFG
         LinkedList<Block> blocks;
         blocks = cfgParser.program(stable, funtable);

         String fileName = _inputFile;
         boolean print = _displayCFG, printSparc = _displaySparc;

         if(print) {
            BufferedWriter codeWriter = null;
            if(!debug) {
               try {
                  String sourceFile = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length());
                  if (printSparc)
                     fileName = fileName.replace(".ev", ".s");
                  else if (!printSparc)
                     fileName = fileName.replace(".ev", ".il");

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
         for(Block b : blocks) {
            LinkedList<Block> revCFG = b.getTopo();
            /*for (Block h : revCFG) {
               System.out.println(h);
            }*/
           LinkedList<LiveEntry> liveSet = revCFG.getFirst().getLiveSet(new LinkedList<LiveEntry>());
           System.out.println("\n"+liveSet);
         }
         
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
   
   private static void cleanYourShitUp(Block head) {
      LinkedList<Block> family = new LinkedList<Block>();
      LinkedList<Instruction> newIloc = new LinkedList<Instruction>();
      LinkedList<String> newLabels = new LinkedList<String>();

      Block temp = null;
      if(head == null) {
         System.out.println("OMG LOL");
         return;
      }
      for(Block buddy : head.getNanny()) {
         for(temp = buddy; !temp.reservedBlock(); temp = temp.getFirstChild()) {
            newIloc.addAll(0, temp.getInstructionList());
            newLabels.addAll(0, temp.getLabelList());
         }
         Block newBlock = new Block();
         newBlock.addILoc(newIloc);
         newBlock.addLabels(newLabels);
         family.add(newBlock);   
      }
      for(Block child : family) {
         child.addNext(temp);
      }
      cleanYourShitUp(temp);
      head.setNext(family);
   }

   private static final String DISPLAYAST = "-displayAST";
   private static final String DISPLAYTYPECHECK = "-displayTypecheck";
   private static final String DISPLAYCFG = "-dumpIL";
   private static final String DISPLAYSPARC = "-displaySparc";

   private static String _inputFile = null;
   private static boolean _displayAST = false;
   private static boolean _displayTypecheck = false;
   private static boolean _displayCFG = true;
   private static boolean _displaySparc = false;

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
