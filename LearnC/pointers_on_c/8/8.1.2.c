#include <stdio.h>

main(){
    int array[10];
    int *ap = array+2;

    printf("%d\n", ap[-1]);
    printf("%d\n", *(ap-1));
    printf("%d\n", *ap);
    printf("%d\n", 2[array]);
}
