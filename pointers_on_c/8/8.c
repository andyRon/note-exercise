#include <stdio.h>

void
strcpy_( char *buffer, char const *string){
    while( (*buffer++ = *string++) != '\0')
        ;
}
void
main(){
//    int a[10];
//    printf("%d",sizeof(a));
//    int *c;
//    c = &a[0];
//    printf("%d - %d",a+1, c+1);
//    int array[10];
//    int *ap = array + 2;
//    printf("%d\n",ap[9]);
//    printf("%d",2[array]);

//    int array2[10], a;
//    for(a=0;a<10;a+=1)
//        array[a] = 0;

    int array2[10], *ap;
    for(ap=array2; ap<array2+10;ap++)
        *ap=0;

    char const *   str="dfdf";
//    char * const    str="dfdf";
//    printf("%c", *str++);
    int aa[10];

}
