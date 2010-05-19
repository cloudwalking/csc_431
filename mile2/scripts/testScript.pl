#!/usr/bin/perl

$testLang = $ARGV[0];
$testFile, $diffOutput, $sparcFile;
$runEvil = "java Evil";
$testDir = "testOutput";
$sparcDir = "$testDir/benchmarkSparc/";

if (! -e $testDir) {
   mkdir $testDir or die("could not make test directory");
}

if ($testLang eq "iloc") {

   foreach (<benchmarks/*/*>) {
      if ($_ =~ /\.ev/) {
         $inputFile = $_;
         $_ =~ s/\.ev/\.il/;
         #print "$runEvil -displayCFG $inputFile > $_\n";
         `$runEvil -displayCFG $inputFile > $_`;
      }
   }
}
elsif ($testLang eq "sparc") {

   foreach (<benchmarks/*/*>) {
      if ($_ =~ /\./) {

         if ($_ =~ /\.ev/) {
            $inputFile = $_;
            $diffOutput = $_;
            $_ =~ s/\.ev/\.test/;
            $diffOutput =~ s/\.ev/\.diff/;
            $testFile = $_;
            $sparcFile = $_;
            $sparcFile =~ s/\.test/\.s/;
            #print "$runEvil -displayCFG $inputFile > $testDir/$_\n";
            `$runEvil -displayCFG $inputFile > $testDir/$_`;
         }

         #print "diff $testFile $sparcFile > $testDir/$diffOutput\n";
         `diff $testFile $sparcDir/$sparcFile > $testDir/$diffOutput`;
      }
   }
}
else {
   foreach (<benchmarks/*/*>) {
      if ($_ =~ /\.ev/) {
         print "typechecking $_\n";
         `$runEvil -displayTypecheck $_`;
      }
   }
}
