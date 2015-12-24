#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <ctype.h>

int palindrome(char *string){
    char *first = string;
    char *end = string + strlen(string) - 1;

    for(;first <= end;){
        while(!isalpha(*first)) {
            first++;
        }
        while(!isalpha(*end)) {
            end--;
        }
        if (first > end)
            return 2;
        if (isupper(*first))
            *first += 32;
        if (isupper(*end))
            *end += 32;
//        printf("%d,%d\n", *first, *end);
        if (*first != *end)
            return 3;

        first++;
        end--;
    }
    return 1;
}

void
main(){
    printf("%d", palindrome("ad237* fd1fd23 +-*a"));
}
