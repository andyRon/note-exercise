#include <stdio.h>

void
main(){
    int actual_data[20] = {2,35,6,3,67,89,10,13,23,32};
    int *data = actual_data -1;
    printf("%d\n", actual_data);
    printf("%d\n", data);


}
