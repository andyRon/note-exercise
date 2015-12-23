#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <ctype.h>

int palindrome(char *string){
    char *str;
    *(str+strlen(string)) = 0;
    int a = 0;
    int i = strlen(string);
    while(a<=i) {
        if (*string == '\0') {
            *str = '\0';
        } else if(isalpha(*string)) {
            if (isupper(*string)) {
                *str = *string + 32;
            } else {
                *str = *string;
            }
            str++;
        }
        string++;
        a++;

    }
    printf("%s\n", str);
    return 0;
}

void
main(){
    palindrome("adfx/., sdfa!#@dfa");
}
