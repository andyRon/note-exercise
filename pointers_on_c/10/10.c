#include <stdio.h>

void
main(){
    struct {
        int a;
        char b;
        float c;
    } x;
    struct {
        int a;
        int b;
        int c;
    } y[20], *z;
    struct SIMPLE {
        int a;
        char b;
        float c;
    };
    struct SIMPLE d;
    struct SIMPLE e[10], *w;

    typedef struct {
        int a;
        char b;
        float c;
    } Simple;
    Simple f[15], *v;

    struct COMPLEX{
        float f;
        int a[20];
        long *lp;
        struct SIMPLE s;
        struct SIMPLE sa[10];
        struct SIMPLE *sp;
    };
    struct COMPLEX comp;
//    printf("%d",sizeof(d.b));
    struct COMPLEX *cp;
//    printf("%d",sizeof(cp->sp->b));
    struct SELF_REF2{
        int a;
        struct SELF_REF1 *b;
        int c;
    };
    typedef struct SELF_REF3_TAG {
        int a;
        struct SELF_REF3_TAG *b;
        int c;
    }SELF_REF3;
}
