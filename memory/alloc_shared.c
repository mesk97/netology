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

int create_big_file() {
	int fd = open("/tmp", O_RDWR | O_TMPFILE);
	if (fd == -1) {
		perror("open");
		exit(1);
	}
	lseek(fd, SIZE, SEEK_SET);
	write(fd, "a", 1);
	return fd;
}

int main (int argc, char ** argv)
{
	for (;;) {
		int fd = create_big_file(); 

		// Запрашиваем блок в виртуальной памяти 
		int *ptr = mmap ( NULL, SIZE,
				PROT_WRITE | PROT_READ, MAP_SHARED, fd, 0);
		if (ptr == MAP_FAILED) {
			printf("FAILED");
			exit(1);
		}

		printf ("addr %p\n", ptr);

		// Реально выделяем в памяти
		memset(ptr, 'A', SIZE);
	
		sleep(1) ;
	}
	return 0;
}
