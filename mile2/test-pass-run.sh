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

COUNTER=1
for i in ${tests[@]}
do
   echo -ne "$COUNTER. Assembling $i... "
   gcc -mcpu=v9 benchmarks/$i/$i.s -o benchmarks/$i/$i.out
   echo -ne "Running $i... "
   ./benchmarks/$i/$i.out < benchmarks/$i/input > $i.result
   echo -ne "Checking $i... "
   diff $i.result benchmarks/$i/output | wc -l > /dev/null
   if [ "$?" -eq "0" ]
   then
      echo "pass";
   else
      echo "fail";
   fi
   let "COUNTER+=1"
done

