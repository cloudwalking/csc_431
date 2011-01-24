#!/bin/bash
tests[0]=biggest
tests[1]=binaryConverter
tests[2]=fact_frenzy
tests[3]=fact_sum
tests[4]=Fibonacci
tests[5]=wasteOfCycles
tests[6]=uncreativeBenchmark
tests[7]=mile1
tests[8]=BenchMarkishTopics
tests[9]=creativeBenchMarkName
tests[10]=shapeAreas
tests[11]=primes

for i in ${tests[@]}
do
   echo "Compiling $i..."
   java Evil benchmarks/$i/$i.ev
done

