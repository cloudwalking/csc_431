#!/bin/bash
tests[0]=biggest
tests[1]=binaryConverter
tests[2]=fact_frenzy
tests[3]=fact_sum
tests[4]=Fibonacci
tests[5]=wasteOfCycles

for i in ${tests[@]}
do
   echo "Compiling $i..."
   java ../Evil ../benchmarks/pass/$i.ev
done

