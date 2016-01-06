#include <ctype.h>
#include <string.h>
#define TRUE 1
#define FALSE 0

int
prepare_key( char *key )
{
    register char *keyp;
    register char *dup;
    register int character;

    if( *key == '\0' )
    return FALSE;

    for( keyp = key; ( character = *keyp ) != '\0'; keyp++ ){
        if( !islower( character ) ){
            if( !isupper( character ) )
                return FALSE;
            *keyp = tolower( character );
        }
    }


    for( keyp = key; ( character = *keyp ) != '\0'; ){
        dup = ++keyp;
        while( ( dup = strchr( dup, character))!= NULL )
            strcpy( dup, dup+1);
    }

    for( character = 'a'; character <= 'z'; character += 1 ){
        if( strchr( key, character ) == NULL ){
            *keyp++ = character;
            *keyp = '\0';
        }
    }
    return TRUE;
}

void
main(){
prepare_key("DDDdFJG");

}
