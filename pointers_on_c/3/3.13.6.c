/*
(1) ö������һ�����ϣ������е�Ԫ��(ö�ٳ�Ա)��һЩ���������ͳ�����Ԫ��֮���ö���,������

(2) DAY��һ����ʶ�������Կ���������ϵ����֣���һ����ѡ����ǿ��п��޵��

(3) ��һ��ö�ٳ�Ա��Ĭ��ֵΪ���͵�0������ö�ٳ�Ա��ֵ��ǰһ����Ա�ϼ�1��

(4) ������Ϊ�趨ö�ٳ�Ա��ֵ���Ӷ��Զ���ĳ����Χ�ڵ�������

(5) ö������Ԥ����ָ��#define�������

(6) ���Ͷ����Էֺ�;������

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
