#include <stdlib.h>
#include <stdio.h>

int
main (int ac, char **av)
{
	int exit_status = EXIT_SUCCESS;
	FILE *input;

	while (*++av != NULL) {
		input = fopen (*av, "r");
		if (input == NULL) {
			perror (*av);
			exit_status = EXIT_FAILURE;
			continue;
		}
		if (fclose (input) != 0) {
			perror ("fclose");
			exit (EXIT_FAILURE);
		}
	}

	return exit_status;
}