/*
(1) 枚举型是一个集合，集合中的元素(枚举成员)是一些命名的整型常量，元素之间用逗号,隔开。

(2) DAY是一个标识符，可以看成这个集合的名字，是一个可选项，即是可有可无的项。

(3) 第一个枚举成员的默认值为整型的0，后续枚举成员的值在前一个成员上加1。

(4) 可以人为设定枚举成员的值，从而自定义某个范围内的整数。

(5) 枚举型是预处理指令#define的替代。

(6) 类型定义以分号;结束。

*/
#include <stdio.h>
int main(){
    enum Jar_Type { CUP, PINT, QUART, HALF_GALLON, GALLON};
    enum Day { MON=1, TUE, WED, THU, FRI, SAT, SUN};

 //   enum Jar_Type2 { CUP, PINY};
    enum COIN { NEW_PENNY_1=1, NEW_PENNY_2=2, NEW_PENNY_5=5, NEW_PENNY_10=10, NEW_PENNY_20=20, NEW_PENNY_50=50,
                POUND_1 = 100, POUND_2 = 200
    };

    printf("%d", PINT);
    return 0;
}
