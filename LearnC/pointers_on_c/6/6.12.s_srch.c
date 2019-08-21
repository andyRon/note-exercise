#include <stdio.h>
#define TRUE 1
#define FALSE 0

int
find_char(char **strings, char value){
    char *string;
    while((string = *strings++ ) != NULL){
        while(*string != '\0'){
            if( *string++ == value)
                return TRUE;
        }
    }
    return FALSE;
}
#include <assert.h>
//int
//find_char2(char **strings, int value){
//    assert(stirns != NUll);
//
//    while(*strings != NULL){
//        while( **strings != '\0'){
//            if(*(*strings)++ == value)
//                return TRUE;
//        }
//        strings++;
//    }
//    return FALSE;
//}

main(){
char a[10] = "adfa";
char *b[10] = {"adfasdf","cadf"};
printf("%s",b[2]);

}
