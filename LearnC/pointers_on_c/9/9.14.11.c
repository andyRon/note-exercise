#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <ctype.h>

void
main()
{
    char *text;
    char *str;
    int count = 0;
    gets(text);
//    printf("%s", strstr("adb the dgc the", " the ")+5);
    str = strstr(text, " the ");
    while(str){
        count++;
        str = strstr(str+5, " the ");
    }

    printf("%d", count);
}
