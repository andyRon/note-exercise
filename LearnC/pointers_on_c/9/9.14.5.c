#include <string.h>
#include <stdio.h>
#include <stddef.h>

void my_strncat(char *dest, char *src, int dest_len)
{
    size_t len, i;
    len = strlen(dest);
    if (len >= dest_len - 1)
        return;
    for(i=len; i<dest_len; i++){
        if(*(src+i-len) == '\0')
            break;
        *(dest+i) = *(src+i-len);
    }
    dest[dest_len-1] = '\0';

}

void
main()
{
    char str[10] = "abcdef" ;
    printf("%d\n", str[7]);
    my_strncat(str, "gh", 10);
    printf("%s", str);
}
