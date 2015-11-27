
int matrix[5][10];
int vector[10];

int (*p)[10] = matrix;

void func1(int *vec);
void func2(int vec[]);


void func3(int (*mat)[10]);
void func4(int mat[][10]);

void main()
{


}
