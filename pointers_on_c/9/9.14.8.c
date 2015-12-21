#include <string.h>
#include <stdio.h>
#include <stddef.h>

char *my_strnchr(char const *str, int ch, int which)
{
    char *r;
    r = str;
    while(which > 0){
        r = strchr(r, ch);
        if (r == '\0')
            return 0;
        which--;
        if ( which == 0) {
            return r;
        }
        r++;

    }
    return r;

}
char *my_strnchr_2(char const *str, int ch, int which)
{
    char *r = 0;
    char *s = str;
    while(--which>=0 && (r = strchr(s,ch)) != 0){
        s = r+1;
    }
    return r;
}

void
main()
{
    char str[] = "fdcdwdfdcccse";

    printf("%s\n", my_strnchr_2(str, 'd', 3));
}

