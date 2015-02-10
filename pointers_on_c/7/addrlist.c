/*
用于维护一个地址列表的抽象数据类型
*/

#include "addrlist.h"
#include <stdio.h>

static char name[MAX_ADDRESSES][NAME_LENGTH];
static char address[MAX_ADDRESSES][ADDR_LENGTH];
static char phone[MAX_ADDRESSES][PHONE_LENGTH];


static int
find_entry( char const *name_to_find){
    int entry;

    for( entry = 0; entry<MAX_ADDRESSES; entry += 1)
        if(strcmp(name_to_find, name[entry]) == 0)
            return entry;
    return -1;
}

char const *
lookup_address( char const *name){
    int entry;

    entry = find_entry(name);
    if(entry == -1)
        return NULL;
    else
        return address[ entry ];
}

char const *
lookup_phone( char const *name){
    int entry;
    entry = find_entry( name );
    if(entry == -1)
        return NULL;
    else
        return  phone[entry];
}
