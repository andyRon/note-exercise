#include <stdio.h>
//char *find_char(char const *source, char const *chars);


/*
注意字符串定义时
数组和指针的区别
*/

char *find_char(char const *source, char  const *chars){
    if(source == NULL || chars == NULL){
        return NULL;
    }
    char *c;
//    char *s=source;
    for(;*source != '\0';source++){
        for(c=chars;*c != '\0';c++){
            if(*c == *source){
                return source;
            }
        }
    }
    return NULL;
}


void
main(){
char *s = "ABCDEF",
     *c = "XFC";
printf("%c", *find_char(s, c));

}
