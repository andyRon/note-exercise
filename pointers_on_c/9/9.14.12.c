#include <string.h>
#include <ctype.h>
#include <stdio.h>

int prepare_key(char *key)
{
    if (*key == NULL ) {
        return NULL;
    }
    register char *keyp;     // 密钥的指针拷贝
    int c;         //单个字符


    // 1. 转换为大写
    for (keyp=key; (c=*keyp) != '\0'; keyp++) {
//        if (!isalpha(c)) {
//            return 0;
//        }
//        if (islower(c)) {
//            *keyp = toupper(c);
//        }

        if (!isupper(c)) {
            if (!islower(c)) {
                return 0;
            }
            *keyp = toupper(c);
        }
    }
    printf("%s", key);exit(0);
    // 2. 去除重复

    // 3. 生成编码好的字符数组



}

void
main(){
prepare_key("DDDdFJG");

}
