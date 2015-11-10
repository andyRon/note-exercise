#include <stdio.h>
#include <stddef.h>

#define PRODUCT_SIZE 20
typedef struct {
    char product[PRODUCT_SIZE];
    int quantity;
    float unit_price;
    float total_amount;
} Transaction;

void
print_receipt(Transaction trans){
    printf("%s\n", trans.product);
    printf("%d @ %.2f total %.2f\n", trans.quantity, trans.unit_price, trans.total_amount);
}
void
print_receipt2(Transaction * trans){
    printf("%s\n", trans->product);
    printf("%d @ %.2f total %.2f\n", trans->quantity, trans->unit_price, trans->total_amount);
}
//  把参数放在寄存器  并且函数中不能修改
void print_receipt3(register Transaction const *trans);

Transaction
compute_total_amount( Transaction trans){
    trans.total_amount = trans.quantity*trans.unit_price;
    return trans;
}
float
compute_total_amount2(Transaction trans){
    return trans.quantity*trans.unit_price;
}
Transaction
compute_total_amount3(register Transaction *trans){
    trans->total_amount = trans->quantity * trans->unit_price;
}

void main(){
//printf("%d\n", sizeof(Transaction));
Transaction t = {
    "eggs",
    123,
    12.9,
    34.56
};
print_receipt2(&t);
//print_receipt(t);
}


