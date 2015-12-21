#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include "9.14.2.c"

char *my_strcat(char *dst, char const *src, size_t size)
{
    size_t length;

    size -= 1;

    length = size - my_strnlen(dst, size);

    if (length > 0) {
        strncat(dst, src, length);
        dst[size] = 0;
    }
    return dst;


}

void
main()
{
    char dst[] = "ab";

    printf("%s", my_strcat(dst, "cdf", 4));


}
