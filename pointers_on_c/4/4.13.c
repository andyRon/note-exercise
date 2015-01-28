
#include <stdio.h>

int main(){
    int x = 2;
    printf("%d\n",3*x*x-4*x+6);
//    (x > 1){
//        printf("yes\n");
//    }

    if(0)
        ;
    else{
            printf("no");
    }

    int i;

    for(i=0;i<10;i+=1)
        printf("%d\n",i);

//    int ch, checksum;
//    while( (ch=getchar()) != EOF){
//        checksum += ch;
//        putchar(ch);
//    }
//    printf("Checksum = %d\n", checksum);

    for(i=1;i<=4;i+=1){
        switch(i%2){
        case 0 :
            printf("even\n");
        case 1 :
            printf("odd\n");
        }
    }
}
