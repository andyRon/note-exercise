int del_substr(char *str, char const *substr);

#include <stdio.h>

//#define NULL 0
#define NUL '\0'
#define TRUE 1
#define FALSE 0


char *match(char *str, char *want){
    while(*want != NUL)
        if(*str++ != *want++)
            return NULL;
    return str;
}

//int del_substr(char *str, char const *substr){
//    char *next;
//    while(*str != NUL){
//        next = match(str, substr);
//        if(next != NULL)
//            break;
//        str++;
//    }
//    if(*str == NUL)
//        return FALSE;
//
//    while(*str++ = *next++)
//        ;
//    return TRUE;
//}


void main(){
    char *a = "ABCDEF";
    char *b = "CDE";
//    if(del_substr(a,b))
//        printf("%s",a);
//    else
//        printf("%d",12);
    if(match(a,b)){
        printf("%s",match(a,b));
    }else{
        putchar('d');
    }
}
