#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define SIZE 100000000LL

int main (int argc, char ** argv)
{
	for (;;) {

		// Запрашиваем блок в виртуальной памяти 
		int *ptr = mmap ( NULL, SIZE, PROT_WRITE | PROT_READ, 
				MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
		if (ptr == MAP_FAILED) {
			printf("FAILED");
			exit(1);
		}

		printf ("addr %p\n", ptr);
		sleep(1) ;
	}
	return 0;
}
