#include <ctype.h>
#include <stdio.h>

int
main()
{
    int c;
    float sum=0;
    int cn,sp,digit,lower,upper,punct,notprint;
    cn=sp=digit=lower=upper=punct=notprint=0;

    while((c=getchar())!= EOF ){
        sum++;
        if (iscntrl(c)) {
            cn++;
        }
        if(isspace(c)) {
            sp++;
        }
        if(isdigit(c)) {
            digit++;
        }
        if(islower(c)) {
            lower++;
        }
        if(isupper(c)) {
            upper++;
        }
        if(ispunct(c)) {
            punct++;
        }
        if(isprint(c) == 0) {
            notprint++;
        }
    }
    if( sum <= 0) {
        printf("0\n");
        return 0;
    }
    printf("\nsum is %.0f .\n\n", sum);
    printf("cntrl is %d.  %.2f\n", cn, cn/sum);
    printf("space is %d.  %.2f\n", sp, sp/sum);
    printf("digit is %d.  %.2f\n", digit, digit/sum);
    printf("lower is %d.  %.2f\n", lower, lower/sum);
    printf("upper is %d.  %.2f\n", upper, upper/sum);
    printf("punct is %d.  %.2f\n", punct, punct/sum);
    printf("notprint is %d.  %.2f\n", notprint, notprint/sum);
    return 0;
}

