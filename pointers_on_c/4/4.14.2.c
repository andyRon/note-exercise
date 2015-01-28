#include <stdio.h>

void main(){
    int n = 100,i,j;
    for(i=2;i<=100;i++){
        int token = 0;
        for(j=2;j<i;j++){
            if(i%j == 0)
                token++;
        }
        if(!token) printf("%d\n",i);
    }
}

