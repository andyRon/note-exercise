
#include <stdio.h>
void
main()
{
    char *buffer = "abcba";
    int i = 0;
    char *f = buffer;
    while( *f++ != '\0'){
        i++;
    }
    f = buffer;
    char *r = buffer + i -1;
    while(f<r){
        if(*f++ != *r--){
            break;
        }
    }
    if(f>=r){
        printf("It is a palindrome!\n");
    }else{
        printf("It not's a palindrome!\n");
    }
}
