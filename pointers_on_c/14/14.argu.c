#include <stdio.h>

#define PRINT(FORMAT,VALUE)     printf( "The value of " #VALUE " is " FORMAT "\n", VALUE)

void
main(){
    int x = 3;
PRINT("%d", x + 3);
}
