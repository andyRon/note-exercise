#include <stdio.h>

float tax[5][3] = {
    {0, 0.15, 0},
    {23350, 0.28, 3502.5},
    {56550, 0.31, 12798.5},
    {117950, 0.36, 31832.5},
    {256500, 0.396, 81710.5}
};
float single_tax( float income);

float
single_tax( float income)
{
    int i = 0;
    for(;i<5;i++){
        if (i == 4 && income > tax[4][0] ) {
            return tax[4][2] + tax[4][1]*(income-tax[4][0]);
        } else if(income >tax[i][0] && income <= tax[i+1][0]){
            return tax[i][2] + tax[i][1]*(income-tax[i][0]);
        }
    }
    return 0;
}

void
main()
{
    printf("%f\n", single_tax(24534));
}

