#include <stdio.h>

union {
    int a;
    float b;
    char c;
}x;


main(){
    x.a = 25;
    //x.b = 3.14;
//    x.c = 'x';
printf("%d %g %c\n", x.a, x.b, x.c);

}
