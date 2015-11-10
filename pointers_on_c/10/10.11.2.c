
struct SALES_STATUS {
    char customer_name[21];
    char customer_address[41];
    char model[21];
    enum { CASH, LOAN, LEASE} type;
    union  {

    }deal;
};
