#include  <stdio.h>

void main(){
    int which_word;
    scanf("%d",&which_word);
//    printf("%d",which_word);
    switch(which_word){
    case 1:
        printf("who");break;
    case 2:
        printf("what");break;
    case 3:
        printf("when");break;
    case 4:
        printf("where");break;
    case 5:
        printf("why");break;
    case 6:
        printf("how");break;
    default:
        printf("don't know");break;
    }
}
