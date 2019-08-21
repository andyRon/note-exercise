#include <stdio.h>

void reverse_string(char *string);

void
main(){
char *string = "avbcde";
reverse_string(string);

printf("%s", string);
}

//void reverse_string(char *string){
//    char *str,
//         *s=string;
//    int i;
//    for(i=0;*s++ != '\0';i++);
//    *(str+i) = '\0';
//    for(s=string;*s != '\0' && i >0;i--,s++){
//        *(str+i-1) = *s;
//    }
//    string = str;
//    char str2[10] = "abcdef";
//    printf("%d",str2[7]);
//}
/*
????
*/
void reverse_string(char *string){
    char *last_char;
    for(last_char=string;last_char != '\0';last_char++)
        ;
    last_char--;
    while(string < last_char){
        char tmp;
        tmp = *string;
        *string++ = *last_char;
        *last_char-- = tmp;
    }
}
