#include <stdio.h>
/*
�ݹ�
*/
long
factorial(int n){
    if(n <= 0){
        return 1;
    }else{
        return n*factorial(n-1);
    }
}

void
main(){
    printf("%ld", factorial(15));
}
