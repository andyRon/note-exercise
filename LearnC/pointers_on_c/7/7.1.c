#include <stdio.h>

int *
find_int(int key, int array[], int array_len){
		int i;

		for(i=0;i<array_len;i+=1){
			if(array[i] == key)	return &array[i];
		}
	return NULL;
}
/*
对值进行奇偶校验 ：value的后n_bits位中为1的个数为偶时返回1，为奇时返回0
*/
int
even_parity( int value, int n_bits ){
    int t = 0;
    while(n_bits>0){
        t += value & 1;
        value >> 1;
        n_bits -= 1;
    }

    return  t % 2 == 0;
}

void
swap(int *x, int *y){
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}
void
main(){
    int a = 12, b = 34;
    swap(&a,&b);

    printf("%d", a);

}
