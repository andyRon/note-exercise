#include <stdio.h>
#include <stdlib.h>
 
int
main(void)
{
  FILE *f1;
    char buffer[] = { 'x' , 'y' , 'z' };
    f1 = fopen("text.txt", "wb+");
    int ret_code = fwrite(buffer, sizeof(char), sizeof(buffer), f1);
    if (ret_code < (int)sizeof(buffer))
       if (ferror(f1))
       {
          perror("fwrite()");
          fprintf(stderr,"fwrite() failed in file %s at line # %d\n", __FILE__,__LINE__-5);
          exit(EXIT_FAILURE);
       }
    fclose(f1);
    return 0;
}