#include <stdio.h>
#include "increment.c"
#include "negate.c"

void
main()
{
    printf("%d\n", increment(-10));
     printf("%d\n", negate(-10));
}
