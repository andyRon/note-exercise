#define N_VALUES    5

void main(){
    float values[N_VALUES];
    float *vp;

    for(vp = &values[0];vp<&values[N_VALUES];)
        *vp++ = 0;

}

