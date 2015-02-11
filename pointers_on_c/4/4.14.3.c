/*
判断三角形类型
*/
#include <stdio.h>

int main(){
    float a,b,c;
    printf("ENTER 3's number: ");
    scanf("%f %f %f",&a,&b,&c);

    if((a+b)<=c || (a+c)<=b || (c+b)<=a){
        printf("不是三角形\n");
        return 0;
    }
    if(a!=b && a!=c && b!=c){
        printf("不等边三角形\n");
    }else if(a==b && b==c){
        printf("等边三角形\n");
    }else{
        printf("等腰三角形\n");
    }


}
