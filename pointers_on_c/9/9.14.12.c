#include <string.h>
#include <ctype.h>
#include <stdio.h>

int prepare_key(char *key)
{
    if (*key == NULL ) {
        return NULL;
    }
    register char *keyp;     // ��Կ��ָ�뿽��
    int c;         //�����ַ�


    // 1. ת��Ϊ��д
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
    // 2. ȥ���ظ�

    // 3. ���ɱ���õ��ַ�����



}

void
main(){
prepare_key("DDDdFJG");

}
