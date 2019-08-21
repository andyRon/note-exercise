#include <stdio.h>
// £¿£¿
void
strcpys( char *buffer, char const *string)
{

    while( *string != '\0'){
            *buffer = *string;
            buffer++;
            string++;
//printf("%c\n",*string);
    }

//    printf("%s",buffer);
//    exit(0);
}

main(){
    char *a;
    char *b= "adbdf";
    strcpys(a,b);
    printf("%s",a);
}
