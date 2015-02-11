#include <stdio.h>

void
main(){
    int vector[5] = {1,5},vector2[5];

//    printf("%d", vector2[2]);

    int matrix[6][10];
//    matrix[0] = {1,2,3,4,5,6,7,8,9};
//    matrix[1] = {11,12,13,14,15,16,17,18,19,110};
//    int *mp;
//    printf("%d", matrix[5][3]);
    int (*mp)[10];
    mp = matrix;

    int two_dim[3][5] = {
        { 9,1,2,3,4},
        {2,3,4,5,6},
        {3,42,23,12,3}
    };
}
