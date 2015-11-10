#include <stdio.h>

union {
    float f;
    int i;
}fi;
void
main(){
fi.f = 1.2;
//printf("%d",fi.i);
//printf("%d\n", sizeof(fi));

}
