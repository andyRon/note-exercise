#include <stdio.h>

void main(){
    int precipitating=1, temperature=35;

    if(precipitating && temperature < 32){
        printf("snowing\n");
    }else if(precipitating && temperature >= 32){
        printf("raining\n");
    }else if(!precipitating && temperature < 60){
        printf("cold\n");
    }else if(!precipitating && temperature >= 60){
        printf("warm\n");
    }

}
