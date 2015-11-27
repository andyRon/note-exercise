#define NULL 0
#include <stdio.h>

void
main(){
    char const *keyword[] = {
        "do",
        "for",
        "if",
        "register",
        "return",
        "switch",
        "while",
        NULL
    };
    printf("%s\n", *(keyword+2));
    char const **k;     // 此处的const是啥意思
    for(k=keyword;*k != NULL;k++){
        printf("%s\n", *k);
    }
}
