#include <stdio.h>
#include <stdlib.h>

/*
结果：stdout is printed to console
*/
int main(void)
{
    // puts("stdout is printed to console");
    // if (freopen("redir.txt", "w", stdout) == NULL)	///stdout 是标准输出流；此处把此后的标准输出流输入到文件redir.txt中了
    // {
    //    perror("freopen() failed");
    //    return EXIT_FAILURE;
    // }
    // puts("stdout is redirected to a file"); // this is written to redir.txt
    // fclose(stdout);
    puts("fgh");
    char a[] = "cc";
    printf("%s\n", stdout);
}