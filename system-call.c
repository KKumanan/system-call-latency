#include <stdio.h>
#include <time.h>
#include <unistd.h>

int main(){
	struct timespec start, end;

	clock_gettime(CLOCK_MONOTONIC, &start);
	for(int i=0; i<100000; i++){	
		getpid();	
	}
	clock_gettime(CLOCK_MONOTONIC, &end);
	double time_taken = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);

	double avg = time_taken / 100000;

	printf("Average system call latency for 100000 calls: %.2f ns\n", avg);

	return 0;
}