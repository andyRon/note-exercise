#include <stdio.h>
#include <string.h>
void
main()
{
    char str[10];
    char *str2 = "adf";
    strcpy(str, str2);
    printf("%s\n",str);
}
