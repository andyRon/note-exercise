#include <stdio.h>
#include <string.h>

void
print_tokens(char *line)
{
    static char whitespace[] = " \t\f\r\v\n";
    char *token;
    for(token = strtok(line, whitespace); token != NULL; token = strtok(NULL, whitespace)) {
        printf("Next token is %s\n", token);
        break;
    }
}

void
main()
{
//    char *buf="dafads adfadsf adfa?sfa ";
//
//    char *token = strtok( buf, " \t\f\r\v\n");
//    printf("%s\n",token);
//    token = strtok(NULL, " \t\f\r\v\n");
//    printf("%s\n",token);
//    token = strtok(NULL, " \t\f\r\v\n");
//    printf("%s\n",token);
//    token = strtok(NULL, " \t\f\r\v\n");
//    printf("%s\n",token);
//    print_tokens("adf adfl");

    char *s = "abc";
    char s2[] = "abc";
    char *token = strtok(s, "b");
//    char *token2 = strtok(s2, "b");

}
