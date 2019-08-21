#include <stdio.h>
unsigned int reverse_bits( unsigned int value){
    unsigned int answer=0,i;
    for(i=1;i != 0; i<<= 1 ){

        answer <<= 1;
        if(value & 1){
            answer |= 1;
        }
        value >>= 1;

    }
    return answer;

}
void main(){
    printf("%u",reverse_bits(25));


}


