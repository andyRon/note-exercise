
struct PHONE{
    int area_code;
    int switchboard;
    int station_number;
};
struct THERE{
    struct PHONE use;
    struct PHONE out;
    struct PHONE pay;
};

typedef struct {
    int date;
    int time;
    struct THERE phone[3];
} INFO;

main(){
}
