#!/usr/bin/perl

$testLang = $ARGV[0];
$testFile, $sparcFile, $diffOutput;

if ($testLang eq "iloc") {

   foreach (<benchmarks/*/*>) {
      if ($_ =~ ".ev") {
         $inputFile = $_;
         $_ =~ s/\.ev/\.il/;
         print "java Evil -displayCFG $inputFile > $_\n";
      }
   }
}
elsif ($testLang eq "sparc") {

   foreach (<benchmarks/*/*>) {

      if ($_ =~ ".ev") {
         $inputFile = $_;
         $diffOutput = $_;
         $_ =~ s/\.ev/\.test/;
         $diffOutput =~ s/\.ev/\.diff/;
         $testFile = $_;
         print "java Evil -displayCFG $inputFile > $_\n";
      }

      elsif ($_ =~ ".c") {
         $sparcFile = $_;
         $sparcFile =~ s/\.c/\.s/;
         print "gcc -S $_\n";
      }

      print "diff $testFile $sparcFile > $diffOutput\n";
   }
}
else { die("Invalid test language\n"); }
