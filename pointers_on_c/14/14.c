#include <stdio.h>

void
main(){
//    printf(__FILE__);
//    printf("ddd ""cc sdf");

    int sum5=0;
#define ADD_TO_SUM(sum_number, value) sum ## sum_number += value

ADD_TO_SUM(5,25);
printf("%d",sum5);
}

