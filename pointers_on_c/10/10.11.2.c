
struct SALES_STATUS {
    char customer_name[21];
    char customer_address[41];
    char model[21];
    enum { CASH, LOAN, LEASE} type;
    union  {
        struct {
            float retail_price;
            float selling_price;
            float sales_tax;
            float licensing_fee;
        }cash;
        struct {
            float retail_price;
            float selling_price;
            float sales_tax;
            float licensing_fee;
            float down_payment;
            float lan_duration;
            float interest_rate;
            float monthly_payment;
            float bank;
        }loan;
        struct {
            float retail_price;
            float selling_price;
            float down_payment;
            float security_deposit;
            float monthly_payment;
            float lease_term;
        }LEASE;
    }deal;
};
