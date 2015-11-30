#include <stdio.h>


int
identity_matrix( int const *matrix, int size)
{
    int i,j;
    for(i=0;i<size;i++){
        for(j=0;j<size;j++){
            if (*(matrix+i*size+j) != (i == j)) {
                return 0;
            }
        }
    }
    return 1;
}
void
main()
{
    int a[4][4] = {
        {
            1,0,0,0
        },
        {
            0,1,0,0
        },
        {
            0,0,1,0
        },
        {
            0,0,0,1
        }

    };
    printf("%d\n", identity_matrix(a,4));

}

