#include <stdio.h>
/*
ตÝน้
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
