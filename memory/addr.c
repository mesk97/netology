#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

// Это функция - ее код находится в сегменте "Код/Code"
int main (int argc, char ** argv)
{
	// Это локальная перменная функции - она находится в сегменте "Стэк/Stack"
	int v = 3;

	printf("Code  is at %p \n", (void *)main);
	printf("Heap  is at %p \n", 
		malloc(8)); // Malloc выделяет память в сегмента "Куча/Heap"
	printf("Stack is at %p \n", (void *)&v);

	sleep (100);
	return 0;
}
