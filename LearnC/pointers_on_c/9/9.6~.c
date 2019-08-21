#include <stdio.h>
#include <string.h>
void
main(){
    int len1, len2;
    char buffer[] = " 25,142,330,Smith,J,239-4123";

    len1 = strspn(buffer, "0123456789");
    len2 = strspn(buffer, ",0123456789");
    char *ptr = buffer + strspn(buffer, " \n\r\f\t\v");
    len2 = strcspn(buffer,",14");
//    printf("%d",len2);
    printf("%s",strerror(6));
}
