#include "bar.h"
#include "foo.h"

#include <stdio.h>
#include <stdlib.h>


void print_usage(const char *name) {
	printf("Usage: %s <arg>\n", name);
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		print_usage(argv[0]);
		exit(1);
	}

	int a = atoi(argv[1]);

	printf("%i\n", foo(bar(a)));

	return 0;
}
