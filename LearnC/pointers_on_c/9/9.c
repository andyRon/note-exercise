#include <string.h>
#include <stdio.h>

void
main(){
//    char message[20] = "Original mess";
//
//    char *a = strcpy(message, "A different ");
//
//    char *b = strcat(message, " Hell");
//    char str[10] = "A difeuvd";
//    printf("%s",str);
//    printf("%s", message);
//    printf("%d", strcmp(a,str));
//    printf("%d", sizeof(message));
//    char *src = "dhjsc";
//    char *dd = strncpy(str,src,7);
//    printf("%c\n",*(dd+7));
//    printf("%d\n",strlen(dd));
//    char str[5] = "abcd";
//    char *a = "efghi";
//    printf("%s\n",strncat(str,a,2));

//    char string[20] = "abcdefABCD";
//    char *ans;
//    ans = strchr(string, 'd');
//    ans = strpbrk(string, "bfA");
//    ans = strstr(string, "fAB");
//    printf("%c",*ans);

    char message[] = "Original message";
    strcpy(message, "Different");
    char *p = message;
    printf("%s", p+10);
}
