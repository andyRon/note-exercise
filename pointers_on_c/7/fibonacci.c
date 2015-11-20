#include <stdio.h>
int sum;  //递归函数调用多少次
/*
递归
*/
long
fibonacci(int n){
    sum++;
    long a;
    if(n <= 2){
        a = 1;
    }else{
        a = fibonacci(n-1) + fibonacci(n-2);
    }
    return a;
}

main(){
    sum = 0;
    printf("%ld\n", fibonacci(40));
    printf("%d\n", sum);
}
