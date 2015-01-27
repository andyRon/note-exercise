#include <stdio.h>

int main(){
    printf("sizeof(double)=%d\n",sizeof(double));
    printf("sizeof(long)=%d\n",sizeof(long));
    printf("sizeof(void*)=%d\n",sizeof(void*));
    printf("sizeof(float)=%d\n",sizeof(float));
    printf("sizeof(short)=%d\n",sizeof(short));
    printf("sizeof(long long)=%d\n",sizeof(long long));
    printf("sizeof(char)=%d\n",sizeof(char));
    printf("sizeof(int)=%d\n",sizeof(int));

    double a = 1233;
    float b;
    b = a;
    printf("%g",&a);
    return 0;

}
