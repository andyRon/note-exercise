#include <string.h>
#include <stdio.h>
char *
my_strrstr(char const *s1, char const *s2){
    register char *last;
    register char *current;

    last = NULL;

    if(*s2 != '\0'){
        current = strstr(s1, s2);
        while(current != NULL){
            last = current;
            current = strstr(last+1,s2);
        }
    }
    return last;
}

void main(){
    char str[20] = "dfzldfezldbdflozldp";
    printf("%s",my_strrstr(str,"zld"));
}
