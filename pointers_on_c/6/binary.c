
#include <stdio.h>
#include <stdlib.h>
/*
��ʾint�Ķ�������ʽ
*/
void
show_binary(int a,char *ch){
//    char ch[33];
    int i,j;
    for(i=31;i>=0;i--){
        j = a % 2;
        if(j == 0){
            ch[i] = 48;
        }else{
            ch[i] = 49;
        }
        a >>= 1;
    }
}

void
main(){
//    int num = 100;
//    char str[25];
//    itoa(num, str, 2);
//    printf("The number num is %d and the string str is %s. \n" , num, str);

                       exit(0);

    int a = 1735159650;
    char ch[33];
//    show_binary(a,ch);
    itoa(a,ch,2);           // ��׼�������еĺ���������ߵ�2�Ƕ�����
    printf("%s", ch);
}
