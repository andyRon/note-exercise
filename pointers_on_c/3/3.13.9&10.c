#include <stdio.h>
/*
signed在默认不是有符号的编辑器中起作用
*/
int main(){
    signed int  a = -1;
    unsigned int  b;
    b = a;
    printf("%d %d\n", &a, &b);
    char c = 126;
    printf("%s",&c);
}
