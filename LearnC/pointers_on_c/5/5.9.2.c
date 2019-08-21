
#include <stdio.h>

void main(){
    int a;
    scanf("%c",&a);
    if(a>=65 && a<=77){
        a += 13;
    }else if(a>77 && a<=90){
        a -= 13;
    }else if(a>=97 && a<=109){
        a += 13;
    }else if(a>109 && a<=122){
        a -= 13;
    }

    printf("%c",a);

}
