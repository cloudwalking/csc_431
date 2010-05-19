#!/usr/bin/perl

foreach (<benchmarks/*/*>) {
   if ($_ =~ /\.c/) {
      $sparcFile = $_;
      $sparcFile =~ s/\.c/\.s/;
      #print "gcc -S $_ -o $testDir/$sparcFile\n";
      `gcc -S $_`;
   }
}
