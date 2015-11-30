#include <stdio.h>

void matrix_multiply(int *m1, int *m2, int *r, int x, int y, int z);

void matrix_multiply(int *m1, int *m2, int *r, int x, int y, int z)
{
    int i,j,k,tmp;
    for(i=0;i<x;i++){
        for(j=0;j<z;j++){
            tmp = 0;
            for(k=0;k<y;k++){
                tmp += (*(m1+i*y+k)) * (*(m2+k*z+j));
//                 printf("%d %d\n", *(m1+i*y+k),*(m2+k*z+j));
            }
            *(r+i*z+j) = tmp;
//            printf("i:%d j:%d : %d\n\n", i,j, tmp);
        }
    }
}

void
main()
{
    int m1[3][2] = {
        2, -6,
        3, 5,
        1, -1
    },
    m2[2][4] = {
        4, -2, -4, -5,
        -7, -3, 6, 7
    },
    r[3][4];

    matrix_multiply(m1,m2,r, 3,2,4);

    printf("%d\n", r[0][3]);
}
