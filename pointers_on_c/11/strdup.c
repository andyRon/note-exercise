/*
用动态分配内存制作一个字符串的一份拷贝。
*/
#include <stdlib.h>
#include <string.h>

char *
strdup( char const *string){
    char *new_string;
    new_string = malloc( strlen(string) + 1);

    if( new_string != NULL)
        strcpy(new_string, string);

    return new_string;
}
