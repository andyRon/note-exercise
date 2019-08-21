#include <stdio.h>
#include <string.h>
void
main()
{
//    char str[10];
//    char *str2 = "adf";
//    strcpy(str, str2);
////    printf("%s\n",str);
//
//    printf("%d\n",strchr(str2,97));
//    printf("%c\n",strchr(str2,97));
//    printf("%c\n",36); // $
//    printf("%c\n",4206628);
//     printf("%x\n",4206628);  // 403024   0x24ascii×Ö·ûÊÇ$
//     printf("%d\n","hello!");
//    printf("%c\n","hello!");    // 4
//    printf("%x\n", 4206644);    // 403034   0x34  4

    char *str3 = "dfbdpHdx>?";
//    printf("%s\n", strpbrk(str3, "bH"));
//    printf("%s\n", strstr(str3, "Hd"));
//    printf("%d\n", strspn(str3, "dfbpH"));
//    printf("%d\n", strcspn(str3, "p>x"));

    int i;
    for(i=0;i<45;i++){
        printf("%s\n", strerror(i));
    }

}
