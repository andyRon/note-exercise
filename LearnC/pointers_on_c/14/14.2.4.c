#include <stdio.h>

//#define MAX(a,b)    ( (a)>(b) ? (a) : (b) )
//
//void
//main(){
//    int x=5,
//        y = 8,
//        z = MAX(x++,y++);
//    printf("x=%d, y=%d, z=%d\n",x,y,z);
//}


#define EVENPARITY(ch)  ( (count_one_bits(ch) & 1) ? (ch) | PARITYBIT | (ch) )
