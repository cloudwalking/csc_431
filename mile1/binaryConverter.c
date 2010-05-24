#include <stdio.h>
#include <string.h>

int wait(int waitTime)
{
   while (waitTime > 0)
   {
      waitTime = waitTime - 1;
   }
}

int power(int base, int exponent)
{
   int product;

   product = 1;
   while (exponent > 0)
   {
      product = product * base;
      exponent = exponent - 1;
   }

   return product;
}

int recursiveDecimalSum (int binaryNum, int decimalSum, int recursiveDepth)
{
   int tempNum, base, remainder;

   if (binaryNum > 0)
   {
      base = 2;

      tempNum = binaryNum / 10;
      tempNum = tempNum * 10;
      tempNum = binaryNum - tempNum;

      if (tempNum == 1)
      {
         decimalSum = decimalSum + power(base, recursiveDepth);
      }

      return recursiveDecimalSum(binaryNum / 10, decimalSum, recursiveDepth + 1);
   }

   return decimalSum;
}

int convertToDecimal(int binaryNum)
{
   int recursiveDepth, decimalSum;

   recursiveDepth = 0;
   decimalSum = 0;

   return recursiveDecimalSum(binaryNum, decimalSum, recursiveDepth);
}

int main()
{
   int number, waitTime;

   scanf("%d", &number);

   number = convertToDecimal(number);
   waitTime = number * number;

   while (waitTime > 0)
   {
      wait(waitTime);
      waitTime = waitTime - 1;
   }

   fprintf(stdout, "%d\n", number);
}
