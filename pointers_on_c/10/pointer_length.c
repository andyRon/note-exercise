#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<stddef.h>
struct p{
  int n;
  float f;
};
int main()
{
  struct p *sptr;
  printf("sizeof *char: %d\n", sizeof(char*));
  printf("sizeof *int: %d\n", sizeof(int*));
  printf("sizeof *float: %d\n", sizeof(float*));
  printf("sizeof *double: %d\n", sizeof(double*));
  printf("sizeof *struct: %d\n", sizeof(sptr));
  printf("sizeof size_t: %d\n", sizeof(size_t));
  printf("sizeof ptrdiff_t: %d\n", sizeof(ptrdiff_t));
  return 0;
}
