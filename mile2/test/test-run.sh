#!/bin/bash
tests[0]=biggest
tests[1]=binaryConverter
tests[2]=fact_frenzy
tests[3]=fact_sum
tests[4]=Fibonacci
tests[5]=wasteOfCycles

for i in ${tests[@]}
do
   echo "Assembling $i..."
   gcc -mcpu=v9 benchmarks/pass/$i.s -o benchmarks/pass/$i.out
   echo "Running $i..."
   ./benchmarks/pass/$i.out < benchmarks/$i/input > $i.result
   echo "Checking $i..."
   diff $i.result benchmarks/$i/output
done

