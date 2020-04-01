#include <stdio.h>
#include <pthread.h>

 pthread_mutex_t first_mutex = PTHREAD_MUTEX_INITIALIZER;
 pthread_mutex_t second_mutex = PTHREAD_MUTEX_INITIALIZER;

void *do_work_one(void *vargp){
    int done = 0;

    while(!done){
        pthread_mutex_lock(&first_mutex);
        if( pthread_mutex_trylock(&second_mutex) ) {
            for( int i = 0 ; i< 100 ; i++){
                printf("_");
            }


            pthread_mutex_unlock(&second_mutex);
            pthread_mutex_unlock(&first_mutex);
            done = 1;
        }
        else{
            pthread_mutex_unlock(&first_mutex);
        }

    }

    pthread_exit(0);
}

void *do_work_two(void *vargp){
    int done = 0;

    while(!done){
        pthread_mutex_lock(&second_mutex);
        if( pthread_mutex_trylock(&first_mutex) ) {
            for( int i = 0 ; i< 100 ; i++){
                printf("-");
            }


            pthread_mutex_unlock(&first_mutex);
            pthread_mutex_unlock(&second_mutex);
            done = 1;
        }
        else{
            pthread_mutex_unlock(&second_mutex);
        }
    }

    pthread_exit(0);
}

int main(){
    pthread_t thread_1;
    pthread_t thread_2;
    printf("Before Thread\n");
    pthread_create(&thread_1,NULL,&do_work_one, NULL);
    pthread_create(&thread_2,NULL,&do_work_two, NULL);
    pthread_join(thread_1, NULL);
    pthread_join(thread_2, NULL);
    printf("After Thread\n");
    return 0;
}
