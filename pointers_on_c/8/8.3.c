#include <stdio.h>

#include <string.h>
int
lookup_keyword(char const * const desired_word, char const *keyword_talbe[], int const size){
    char const **kwp;
    for(kwp=keyword_talbe;kwp<keyword_talbe+size;kwp++)
        if(strcmp(desired_word, *kwp) == 0)
            return kwp - keyword_talbe;

    return -1;
}


void
main(){
    char const *keyword[] = {
        "do",
        "for",
        "if",
        "register",
        "return",
        "switch",
        "while"
    };
    int a=122;
    printf("%s\n", *keyword);
//    printf("%s\n", sizeof(&a));
//    printf("%s\n", sizeof(*keyword));

    int c;
    c = lookup_keyword("while",keyword,7);
    printf("%d\n", c);
    printf("%d\n", sizeof(keyword));
}
