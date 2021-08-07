#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <stdint.h>

// preset primes
#define P 57557
#define Q 52361
#define N 3013742077
#define D 65537
#define E 1270666913
#define BIT_SIZE 32
#define MAX_BIT_SIZE 64

/**
 * Delays the program according to the given parameter
 * (Considered "constant" within its own logic)
 */
void constant_delay(int num_secs){
    long pause = num_secs*CLOCKS_PER_SEC;
    clock_t past = clock();

    while((clock()-past) < pause);
}

/**
 * Generates a random number within the given range then calls constant_delay()
 * (Considered "random" because of the randomly-chosen number)
 */
void random_delay(int lower_limit, int upper_limit) {
	int num_secs = rand() % (upper_limit - lower_limit + 1) + lower_limit;	
	constant_delay(num_secs);
}

/*
Returns number of bits in integer value
*/
int count_num_bits(uint32_t value) {
    int count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
    }
    return count;
}

/*
Montgomery Modular Multiplication algorithm
Returns result of X * Y given N largest key size (modulus)
*/
uint32_t MMM(uint32_t X, uint32_t Y) { 
	uint64_t T = 0;
	uint64_t T_fake = 0;
	uint8_t m = count_num_bits(N);
	
	for ( uint32_t i = 0; i < m; i++ ) {
		bool nu = (T & 1) ^ ((X & (1 << i)) && (Y & 1));
		T = (T + ((X & (1 << i)) >> i)*Y + nu*N) >> 1;
	}
	
	if (T >= N) {
		T = T - N;
	} else {
	    T_fake = T - N;
	}
	
	return (T << m) % N;
}

/*
Right-to-Left Multiply and Square algorithm using MMM
Returns RSA-encrypted message
*/
uint32_t RTL_MME(uint32_t msg, uint32_t exp) {
	uint32_t t = msg;
	uint32_t r = 1;
	uint32_t r_fake =  1;

	random_delay(1, 3);
	
	for ( int i = 0; i < BIT_SIZE; i++ ) {
		if (exp & (1 << i)) {
			r = MMM(r, t) % N;
		} else {
			r_fake = MMM(r, t) % N;
		}

		random_delay(0, 1);
		
		t = MMM(t, t) % N;
	}

	random_delay(1, 3);

    return r;
}

int main() {
    srand(time(NULL));

	// scan for msg value, must be less than N
	uint32_t msg;
	printf("Enter a message to encrypt (0 - %lu):\n", N);
	scanf("%lu", &msg);

    // Test MMM
	printf("\n---------- TESTING MMM ----------\n");
	printf("MMM result: %i\n", MMM(179, 145));
	printf("MMM result: %i\n", MMM(17, 22));
	printf("---------------------------------\n");

    // Test exponentiation
	uint32_t encr_msg = RTL_MME(msg, E);
	uint32_t decr_msg = RTL_MME(encr_msg, D);
	printf("\n------- TESTING ENCRYPTION -------\n");
	printf("Encrypted Message: %lu\n", encr_msg);
	printf("Decrypted Message: %lu\n", decr_msg);
	printf("---------------------------------\n");

    return 0;
}
