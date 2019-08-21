#include <stdio.h>

union {
    float f;
    int i;
}fi;

struct VARIABLE {
    enum { INT, FLOAT, STRING } type;
    union {
        int i;
        float f;
        char *s;
    }value;
};

void
main(){
    fi.f = 3.14159;
    printf("%d\n",fi.i);
}
