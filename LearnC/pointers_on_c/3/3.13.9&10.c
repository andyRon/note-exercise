#include <stdio.h>
/*
signed��Ĭ�ϲ����з��ŵı༭����������
*/
int main(){
    signed int  a = -1;
    unsigned int  b;
    b = a;
    printf("%d %d\n", &a, &b);
    char c = 126;
    printf("%s",&c);
}
