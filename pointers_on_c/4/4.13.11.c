
#include <stdio.h>

int main(){
    int x,y,a,b;
    scanf("%d %d %d %d",&x,&y,&a,&b);

    if(x<y || a>=b){
        printf("WRONG");
    }else{
        printf("RIGHT");
    }
}
