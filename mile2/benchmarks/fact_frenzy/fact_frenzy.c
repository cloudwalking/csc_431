#include<stdio.h>
#include<malloc.h>
struct EV_myvals
{
int EV_val;
int EV_acc;
};
struct EV_myvals * factarth(struct EV_myvals * EV_var)
{
EV_var->EV_acc = (EV_var->EV_acc*EV_var->EV_val);
EV_var->EV_val = (EV_var->EV_val-1);
return EV_var;
}
int fact(int EV_var)
{
struct EV_myvals * EV_myvar;
int EV_acc;
EV_myvar = (struct EV_myvals*)malloc(sizeof(struct EV_myvals));
EV_myvar->EV_val = EV_var;
EV_myvar->EV_acc = 1;
while ((EV_myvar->EV_val>1))
{
EV_myvar = factarth(EV_myvar);
}
EV_acc = EV_myvar->EV_acc;
free(EV_myvar);
return EV_acc;
}
int main()
{
int EV_resval;
int EV_i;
int EV_loopval;
int EV_inputval;
scanf("%d", &EV_inputval);
scanf("%d", &EV_loopval);
EV_i = 0;
while ((EV_i<EV_loopval))
{
EV_resval = fact(EV_inputval);
EV_i = (EV_i+1);
}
printf("%d ",EV_inputval);
printf("%d\n",EV_resval);
return 0;
}
