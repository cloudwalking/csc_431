#include <stdio.h>
int main() {
   int i;
   
   i = fn(5);

   printf("%d", i);

   return 0;
}
int fn(int arg1) {
   arg1 = arg1 + 1;
   return arg1;
}
