#include <stdio.h>

void
main(){
int array[4][2] = {
    {1,2},{3,4},{5,6},{7,8}
};
int *p =array;
int (*p2)[2] = array;
printf("%d\n", array);
printf("%d\n", array[2]);
printf("%d\n", array[2]-1);  // array[2] ��ʾָ�����͵�ָ�� ���Ժ���� 1����  ���͵��ֽ���
printf("%d\n", p+1);
printf("%d\n", p2+1);  //p2��ʾָ�����2������Ԫ�ص������ָ��

printf("%d\n", array[0][3]);

printf("%d\n", array[1][2]);
}
