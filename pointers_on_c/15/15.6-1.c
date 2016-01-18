#include <stdio.h>
#include <stdlib.h>
 
int
main(void)
{
	FILE *input;

	input = fopen("data1","r");

	if (input == NULL) {
		perror("data1");
		exit(0);
	}
}

