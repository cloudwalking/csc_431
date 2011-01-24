#!/bin/bash
tests[0]=programBreaker
tests[1]=stats
tests[2]=hailstone
tests[3]=hanoi_benchmark
tests[4]=TicTac
#tests[5]=bert

#tests[7]=killerBubbles
#tests[8]=bert

for i in ${tests[@]}
do
   echo "Compiling $i..."
   java Evil benchmarks/$i/$i.ev
done

