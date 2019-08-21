char *find_char(char const *source, char const *chars);
int del_substr(char *str, char const *substr);

#include <stdio.h>

void main(){
    char *a = "ABCDEF",*b = "XRCDEF";
//    char *c = a+3;
//    printf("%s",c);
    printf("%c", *find_char(a,b));
}

char *find_char(char const *source, char const *chars){
    char *j;
    for(;*source!='\0';source++){
        for(j=chars;*j!= '\0';j++){
            if(*source == *j){
              return source;
            }
        }
    }
    return NULL;
}

int del_substr(char *str, char const *substr){
    char *sub=substr;
    for(;*str){
        if(){

        }
    }

}
