#include <stdio.h>



void
binary_to_ascii( unsigned int value){
    unsigned int quotient;

    quotient = value / 10;
    if( quotient != 0)
        binary_to_ascii(quotient);
    putchar( value % 10 + '0');
    putchar('\n');
}

void
main(){
//    printf("%d", 3234%10);
//    printf("%c", 3234%10 + '0');

    binary_to_ascii(123123);

}
