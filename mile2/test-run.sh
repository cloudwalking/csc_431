#!/bin/bash
tests[0]=programBreaker
tests[1]=stats
tests[2]=hailstone
#tests[7]=killerBubbles
#tests[4]=bert
tests[3]=hanoi_benchmark
tests[4]=TicTac
for i in ${tests[@]}
do
   echo "Assembling $i..."
   gcc -mcpu=v9 benchmarks/$i/$i.s -o benchmarks/$i/$i.out
   echo "Running $i..."
   ./benchmarks/$i/$i.out < benchmarks/$i/input > $i.result
   echo "Checking $i..."
   diff $i.result benchmarks/$i/output
done

