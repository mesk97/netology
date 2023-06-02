#include "pthread.h"
#include "stdio.h"
#include "time.h"

#define THREAD_COUNT 5
#define ITERATION_LIMIT 500000000LL

//long long count = 0;

static void *hello(void* d) {
    long long count = 0;
    long tid = (long) d;

    while(count < ITERATION_LIMIT) {
        ++count;
    }

    printf("Finish %ld\n", tid);
    return NULL;
}

int main(int argc, char* args[]) {
    pthread_t thread[THREAD_COUNT];
    for (long i = 0; i < THREAD_COUNT; ++i)
        pthread_create(&thread[i], NULL, &hello, (void*) i);
    for (long i = 0; i < THREAD_COUNT; ++i)
        pthread_join(thread[i], NULL);
    return 0;
}
    
