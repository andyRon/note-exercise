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
    char const **k;     // �˴���const��ɶ��˼
    for(k=keyword;*k != NULL;k++){
        printf("%s\n", *k);
    }
}
