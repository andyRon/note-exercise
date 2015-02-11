#include <stdio.h>



int a(){
    static  int x ;
    x=2;
    return 0;

}

int main(){
    //extern int x;
    //x=3;
printf("%d", &a);

int a = 12;

}
