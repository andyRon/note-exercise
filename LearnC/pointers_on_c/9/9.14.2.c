#include <stdio.h>
#include <string.h>
#include <stddef.h>

size_t
my_strnlen(char const *str, size_t size)
{
    register size_t length;

    for(length=0; length < size; length++){
        if (*(str++) == '\0'){
            break;
        }
    }
    return length;
}

