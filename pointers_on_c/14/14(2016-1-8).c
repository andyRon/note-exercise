#include <stdio.h>
#include <string.h>

void
main(){

    printf("%s\n", __FILE__);
    printf("%d\n", __LINE__);
    printf("%s\n", __DATE__);   // "Jan  8 2016"   Jan��8֮���������ո����
    printf("%s\n", __TIME__);
    printf("%d\n\n", __STDC__);

    printf("%d\n", strlen(__DATE__));

}
