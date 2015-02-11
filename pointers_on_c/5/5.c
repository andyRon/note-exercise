#include <stdio.h>



int func(void){
    static int  counter = 1;

    return ++counter;
}

int main(){
    int a=3,b;
    b = a << 3;
//    printf("%d",b);
    int *pi;
    pi = &a;
    *pi = 20;
//    printf("%d",a);

    printf("%f", (float)(25/10));

    int answer;

    answer = func() - func()*func();
    printf("%d\n",answer);

    int leap_year,year;
    leap_year = year%400 == 0 || (year%100 != 0 && year%4==0);

}
