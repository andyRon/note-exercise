#include <stdio.h>

int hermite(int n, int x);

//int hermite(int n, int x){
//    if(n<=0){
//        return 1;
//    }
//    if(n == 1){
//        return 2*x;
//    }
//    int i = 2;
//    int res_2=1,res_1=2*x,res;
//    while(i<=n){
//        i++;
//        res = 2*x*res_1 - 2*(i-1)*res_2;
//        res_2 = res_1;
//        res_1 = res;
//    }
//    return res;
//}


int hermite(int n, int x){
    if(n<=0){
        return 1;
    }
    if(n == 1){
        return 2*x;
    }
    return 2*x*hermite(n-1,x) - 2*(n-1)*hermite(n-2,x);
}


main(){
    printf("%d", hermite(3,2));
}
