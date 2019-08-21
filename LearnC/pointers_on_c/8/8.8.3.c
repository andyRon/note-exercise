#include <stdio.h>

#define I 3
int
identity_matrix( int const a[I][I])
{
    int i,j;
    for(i=0;i<I;i++){
        for(j=0;j<I;j++){
            if (i == j && a[i][j] != 1) {
                return 0;
            } else if( i != j && a[i][j] != 0){
                return 0;
            }
        }
    }
    return 1;
}
void
main()
{
    int a[I][I] = {
        {
            1,0,0
        },
        {
            0,1,0
        },
        {
            0,0,1
        }

    };
    printf("%d\n", identity_matrix(a));

}
