#include <stdio.h>

void main(){
//int *a,*x;
////*a = 13;
//int b = 12,c;
//a = &b;
//*a = 14;
//x = &c;
//printf("%d",*x);
//
//int a;
//int *d = &a;
////d = 10 - *d;
//*&a = 12;
//printf("%d", &a);


//int a = 12;
//int *b = &a;
//int **c = &b;
////int c = &b;
//printf("%d", c);


char ch = 'a';
char *cp = &ch;
//printf("%d\n", *cp);
//printf("%d\n", *cp+1);
//printf("%d\n", *(cp+1));
//printf("%d\n", ++cp);
//printf("%d\n", cp+1);
printf("%d\n", ++*cp++);
}

