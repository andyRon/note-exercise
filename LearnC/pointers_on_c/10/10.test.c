#include <stdio.h>
void main(){
struct {
    int a;
    int b;
} x;

struct {
    int a;
    int c;
}a[10], *b;

struct tag{
    float f;
    char c;
};

struct tag y[20];

struct complex {
    float f;
    int a[20];
    long *lp;
    struct tag s;
    struct tag sa[10];
    struct tag *sp;
};

struct complex  comp;

comp.f = 123.22;
comp.sa[1].f = 23.12;

struct complex *cp;

//printf("%d", (*cp).f);

//typedef struct {
//    int a;
//    SELF_REF3 *b;
//    int c;
//} SELF_REF3;

typedef struct ss{
    int a;
    struct ss *b;
    int c;
} SELF_REF3;

struct INIT_EX{
    int a;
    short b[10];
    struct tag c;

} gg = {
    12,
    { 1,4},
    {
        2.3
    }
};

printf("%d",gg.c.c);
}

