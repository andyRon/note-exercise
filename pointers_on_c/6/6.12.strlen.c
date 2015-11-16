#include <stdio.h>
int
strlen(char *string){
    int length = 0;
    while(*string++ != '\0')
        length += 1;
    return length;
}

main(){
char *a = "adfa";
//printf("%d", a);
printf("%d", strlen(a));

}
