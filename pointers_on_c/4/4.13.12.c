#include <stdio.h>

void main(){
    int year,leap_year=0;
    scanf("please input year : %d",&year);
    if(year%400 == 0){
        leap_year = 1;
    }
    printf("leap_year is %d",leap_year);

}
