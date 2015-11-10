#include <stdio.h>
#include <stddef.h>



void main(){

//printf("%d\n",sizeof(int));

struct ALIGN{
    char a;
    int b;
    char c;
}x;
struct ALIGN2{
    int b;
    char a;
    char c;
}y;
//printf("%d\n", sizeof(x));
//printf("%d\n", sizeof(y));
//printf("%d\n", offsetof(struct ALIGN2, c));

}

