#include <stdio.h>
/*
Ñ­»·
*/
long
factorial(int n){
    long a = 1;
    while(n > 1){
        a *= n;
        n--;
    }
    return a;
}

void
main(){
    printf("%d", factorial(15));
}

