#include <stdio.h>
#include <string.h>

#define LINE_SIZE 129
main(){
    char input[LINE_SIZE], previous_line[LINE_SIZE];
    int printed_from_group = 0;

    if(gets( previous_line) != NULL ){
        while( gets(input) != NULL){
            if( strcmp(input, previous_line) != 0){
                printed_from_group = 0;
                strcpy( previous_line, input);
            }else if( !printed_from_group ){
                printed_from_group = 1;
                printf("%s\n", input);
            }
        }
    }
}
