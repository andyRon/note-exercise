#include <string.h>
#include <stdio.h>

int
main()
{
//    char *dst;
//    char *src = "bdcgb";
//    memcpy(dst, src, 2);
//    printf("%s\n", dst);

    char buffer[] = "dgfh?>#";
    memset(buffer, 97, 2);
    printf("%s\n", buffer);

//    char dst[] = "abc";
//    char *src = "efg";
//    strncat(dst, src, 2);
//    printf("%s\n", dst);

    return 0;
}

