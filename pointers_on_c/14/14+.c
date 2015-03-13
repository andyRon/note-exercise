
#define MALLOC(n, type) \
        ( (type *)malloc( (n) * sizeof(type) ) )

pi = MALLOC(25, int);
