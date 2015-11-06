#include <stdio.h>
#include <stddef.h>
void
main(){
    typedef struct {
        int a;
        short b[2];
    }Ex2;
    typedef struct EX {
        int a;
        char b[3];
        Ex2 c;
        struct EX *d;
    }Ex;
    Ex x = {10,"Hi", {5,{-1,25}},0};
    Ex *px = &x;
    printf("%d\n",sizeof(x.d));
    printf("%d\n",px);
    printf("%d\n",px+1);
    printf("%d\n",sizeof(px->c.b));
//    printf("%d\n",(int)(*px)+1);
//    int *pi;
//    pi = (int *)px;
//    printf("%d\n",pi);
//    pi = &px->a;
//    px->b[1];
//    printf("%d\n",*(px->c.b+1));
//    printf("%d\n",px->d);
    printf("%d\n",offsetof(Ex,b));

    printf("%d\n",*px);
    printf("%d\n",px->a);
}
