#include<stdio.h>
#include<malloc.h>
struct EV_rectangle
{
int EV_x;
int EV_y;
};
struct EV_circle
{
int EV_r;
};
struct EV_square
{
int EV_x;
};
int areaCircle(struct EV_circle * EV_circle1)
{
int EV_area;
EV_area = ((EV_circle1->EV_r*EV_circle1->EV_r)*3);
return EV_area;
}
int areaRectangle(struct EV_rectangle * EV_rectangle1)
{
return (EV_rectangle1->EV_x*EV_rectangle1->EV_y);
}
int areaSquare(struct EV_square * EV_square1)
{
return (EV_square1->EV_x*EV_square1->EV_x);
}
int main()
{
int EV_mode;
struct EV_rectangle * EV_rectangle1;
struct EV_circle * EV_circle1;
struct EV_square * EV_square1;
EV_rectangle1 = (struct EV_rectangle*)malloc(sizeof(struct EV_rectangle));
EV_circle1 = (struct EV_circle*)malloc(sizeof(struct EV_circle));
EV_square1 = (struct EV_square*)malloc(sizeof(struct EV_square));
EV_mode = 1;
while ((EV_mode!=0))
{
scanf("%d", &EV_mode);
if ((EV_mode!=0))
{
if ((EV_mode==1))
{
scanf("%d", &EV_circle1->EV_r);
printf("%d\n",areaCircle(EV_circle1));
}
else
{
if ((EV_mode==2))
{
scanf("%d", &EV_square1->EV_x);
printf("%d\n",areaSquare(EV_square1));
}
else
{
scanf("%d", &EV_rectangle1->EV_x);
scanf("%d", &EV_rectangle1->EV_y);
printf("%d\n",areaRectangle(EV_rectangle1));
}
}
}
}
return 0;
}
