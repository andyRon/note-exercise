#include <stdio.h>

int *
find_int(int key, int array[], int array_len){
		int i;
		
		for(i=0;i<array_len;i+=1){
			if(array[i] == key)	return &array[i];
		}
	return NULL;
}