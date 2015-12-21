#include <string.h>
#include <stdio.h>


char *my_strcpy(char *dst, char const *src)
{
    int i;
//    printf("%d\n", *(src+0) == 0);
    for(i=0;*(dst+i) != 0 && *(src+i) != 0 ;i++){
//            printf("%c\n", *(dst+i));
        *(dst+i) = *(src+i);
    }
    return dst;
}

main(){
    char dst[10] = "ab";
//    dst[1]= 'c';
    printf("%s", my_strcpy(dst, "sdfdsf"));
}
