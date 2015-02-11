#include <stdio.h>

void main(){
    int a;
    scanf("%c",&a);
    if(a>=65 && a<=90){
        a += 32;
    }

    printf("%c",a);

}
