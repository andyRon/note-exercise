#include <stdio.h>

void func(int const a, int const b[]);

void
func(int const a, int const b[]){
//    b[1] = 2;
}

void
main(){

int a = 1;

int b[3] = {1,1,1};

func(a,b);



}

void func2(int array[3][2][5]);

void func3(int array[][2][5]);

void func4(int (*array)[2][5]);
