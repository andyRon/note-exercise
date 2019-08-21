#include <string.h>
#include <stdio.h>
#include <stddef.h>

char *
my_strrchr( char const *str, int ch)
{
    char *rp = str;
//    size_t l = strlen(str);
    rp += strlen(str)-1;
    while(rp != str) {
        if(*rp == ch)
            return rp;
        rp--;
    }
    return 0;
}

void
main()
{
    char str[] = "fdcdwdfdcccse";

    printf("%s\n", str);
    printf("%s\n", my_strrchr(str, 'q'));
}
