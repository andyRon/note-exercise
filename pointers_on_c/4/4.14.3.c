/*
�ж�����������
*/
#include <stdio.h>

int main(){
    float a,b,c;
    printf("ENTER 3's number: ");
    scanf("%f %f %f",&a,&b,&c);

    if((a+b)<=c || (a+c)<=b || (c+b)<=a){
        printf("����������\n");
        return 0;
    }
    if(a!=b && a!=c && b!=c){
        printf("���ȱ�������\n");
    }else if(a==b && b==c){
        printf("�ȱ�������\n");
    }else{
        printf("����������\n");
    }


}
