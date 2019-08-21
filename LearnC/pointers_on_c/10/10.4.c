
typedef struct {
    char product[PRODUCT_SIZE];
    int quantity;
    float unit_price;
    float total_amount;
} Transaction;

void
print_receipt( register Transaction const *trans){
    printf("%s\n", trans->product);
    printf("%d @ %.2f total %.2f\n", trans->quantity, trans->unit_price, trans->total_amount);
}
print_receipt(&current_trans);

void
comput_total_amount(register Transaction *trans){
    trans->total_amount = trans->quantity * trans->unit_price;
}
comput_total_amount(&current_trans);
