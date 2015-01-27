#include <stdio.h>

int main(){
    char * a = "sdfsdf";
    printf("%s\n",a);
    char buffer[20] = "hello";
    printf("%s\n", &buffer[1]);
    printf("%d\n", sizeof(buffer[1]));
    printf("%d\n", &buffer[1]);
    printf("%s\n", &buffer[4]);
    a = "dfd";  \\ ±‡“Î∆˜
    printf("%s\n" ,a);

    return 0;

}
