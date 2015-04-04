#include <stdio.h>
#include <errno.h>
#include <math.h>
void
main(){
//    errno = 3;
////printf("%d",errno);
//perror("test");
//
//printf("%d\n",FOPEN_MAX);
//printf("%d\n",FILENAME_MAX);

    FILE *input;
    input = fopen("data4","r");
    if(input == NULL){
        perror("data4");
        printf("%d",errno);
    }else
        printf("%d",input);
}
