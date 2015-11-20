#include <stdio.h>

/*
Ñ­»·
*/
long
fibonacci(int n){

    int i=3,n_1=1,n_2=1;
    long res = 0;
    while(i<=n){
        res = n_1 + n_2;
        n_1 = n_2;
        n_2 = res;
        i++;
    }
    return res;
}

main(){
    printf("%ld\n", fibonacci(40));
}

