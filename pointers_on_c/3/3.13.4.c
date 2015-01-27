#include <stdio.h>
// ?? 不同机器 不同int的范围输出结构
int main(){
    long int a = 2147483647;
    short int b;
    b = a;
    printf("%d \n",&a);
    printf("%d",&b);
    return 0;

}
