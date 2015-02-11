#include <stdio.h>



void
copy_n( char dst[], char src[], int n){
    int dst_index, src_index;
    src_index = 0;
    for( dst_index=0;dst_index<n;dst_index+=1){
        dst[dst_index] = src[src_index];
        if(src[src_index] != 0)
            src_index += 1;
    }
}

int main(){
    char a[10]="sdfdfa", b[10];
    copy_n(b,a,5);
    printf("%s",b);
    return 0;
}
