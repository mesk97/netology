#include "pthread.h"
#include "stdio.h"
#include "time.h"

#define THREAD_COUNT 13
#define ITERATION_LIMIT 10000000LL


static void *hello(void* d) {
    long long count = 0;
    long tid = (long) d;

    while(count < ITERATION_LIMIT) {
        ++count;
        if (count % 1000 == 0)  {
            printf("t %ld\n", tid); // Печатаем в аутпут сообщение каждый 1000 раз
        }
    }

    printf("Finish %ld\n", tid);
    return NULL;
}

int main(int argc, char* args[]) {
    pthread_t thread[THREAD_COUNT];
    
    // создаем треды
    for (long i = 0; i < THREAD_COUNT; ++i)
        pthread_create(&thread[i], NULL, &hello, (void*) i);

    // ожидаем окончания тредов
    for (long i = 0; i < THREAD_COUNT; ++i)
        pthread_join(thread[i], NULL);
    return 0;
}
    
