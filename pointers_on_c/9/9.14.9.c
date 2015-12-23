#include <string.h>
#include <stdio.h>
#include <stddef.h>

int count_chars( char const *str, char const *chars){
    int count = 0;
    char *s = str;
    for(;*s != '\0';) {
        if (strchr(chars, *s) != 0){  //ע�� strchar���0  ��Ҳ���ǵ�*sΪ0ʱ��strchr���Ϊchars��β��0��ָ��
            count++;
        }
        s++;
    }
    return count;
}


int count_chars_2( char const *str, char const *chars) {
    int count = 0;

    while((str = strpbrk(str, chars)) != 0) {
        count++;
        str++;
    }

    return count;
}



void
main(){
    char *str="adbdb";
    char *chars = "b";
//    printf("%d", strchr("abc", 0));
    printf("%d", count_chars_2(str, chars));

}
