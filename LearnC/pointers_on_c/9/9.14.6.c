#include <string.h>
#include <stdio.h>
#include <stddef.h>

char *
my_strcpy_end(char *dst, char *src)
{
    do {
        if (*src == '\0') {
            dst = src;
            break;
        }
        *dst++ = *src;

    }while(*src++ != '\0');

    return dst;
}
char *
my_strcpy_end_2(char *dst, char *src)
{
    strcpy(dst, src);
    return dst+strlen(src);

}
void
main(){
    char str[] = "abc";
    char *r;
    r = my_strcpy_end(str, "dfdfg");
    printf("%s", (r-5));
}
