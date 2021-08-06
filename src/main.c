#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

// preset primes
#define P 19
#define Q 13
#define N P*Q
#define D 31
#define E 3
#define BIT_SIZE 32

/*
Returns number of bits in integer value
*/
int count_num_bits(int value) {
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
	uint32_t T = 0;
	for ( uint32_t i = 0; i < count_num_bits(N); i++ ) {
		bool nu = (T & 1) ^ ((X & (1 << i)) && (Y & 1));
		T = (T + ((X & (1 << i)) >> i)*Y + nu*N) >> 1;
	}
	if (T >= N) {
		T = T - N;
	}
	return T * (1 << count_num_bits(N)) % N;
}

/*
Right-to-Left Multiply and Square algorithm using MMM
Returns RSA-encrypted message
*/
uint32_t RTL_MME(uint32_t msg) {
	uint32_t t = msg;
	uint32_t r = 1;
	for ( int i = 0; i < BIT_SIZE; i++ ) {
		if (E & (1 << i))
			r = (r*t) % N;
		t = (t * t) % N;
	}
    return r;
}

int main() {
    srand(time(NULL));

	uint32_t msg = 55;

    // Test MMM
	printf("MMM result: %i\n", MMM(179, 145));
	printf("MMM result: %i\n", MMM(17, 22));
    // Test exponentiation
	printf("Encrypted Message: %i\n", RTL_MME(msg));

    return 0;
}
