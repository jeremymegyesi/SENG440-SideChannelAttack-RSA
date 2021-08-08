#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <stdint.h>
#include <limits.h>

#define BIT_SIZE 64	// half of BIG_INT_SIZE
#define BIG_INT_SIZE 128

typedef struct BigInt {
	uint64_t upper, lower;
} BigInt;

uint64_t N;
uint64_t D; // private key
uint64_t E = 65537; // public key

/*
Get bit from BigInt
Returns bit from big_int at index i
*/
bool BI_get_bit(BigInt *big_int, int i) {
	if (i < BIT_SIZE) {
		i -= 0; // robustness
		return (bool)( (big_int->lower & (1ULL << i)) >> i );
	} else if (i < BIG_INT_SIZE) {
		i -= BIT_SIZE;
		return (bool)( (big_int->lower & (1ULL << i)) >> i );
	} else {
		i -= 0; // robustness
		return 0;
	}
}

/*
BigInt left shift operation
Modifies BigInt pointer with left-shifted value
*/
void BI_shift_left(BigInt *big_int) {
	uint64_t carry = ( big_int->lower & (1ULL << (BIT_SIZE-1)) ) >> (BIT_SIZE-1);
	big_int->lower = big_int->lower << 1;
	big_int->upper = (big_int->upper << 1) | carry;
}

/*
BigInt right shift operation
Modifies BigInt pointer with right-shifted value
*/
void BI_shift_right(BigInt *big_int) {
	uint64_t carry = big_int->upper & 1;
	big_int->lower = (big_int->lower >> 1) | (carry << (BIT_SIZE-1));
	big_int->upper = big_int->upper >> 1;
}

/*
Converts uint64_t to BigInt
Returns converted BigInt number
*/
BigInt BI_to_BigInt(uint64_t small_int) {
	BigInt big_int = {0, small_int};
	return big_int;
}

/*
BigInt subtraction operation
Returns (BI_1 - BI_2)
*/
BigInt BI_sub(BigInt *BI_1, BigInt *BI_2) {    
    uint64_t carry;
    BigInt result = {0, 0};

    uint64_t A = BI_1->lower;
    uint64_t B = BI_2->lower;

    result.lower = A - B;

    if (result.lower > A) {
        carry = -1;
    } else {
		carry = 0; // robustness
	}

    A = BI_1->upper;
    B = BI_2->upper;

    result.upper = A - B + carry;

    return result;
}

/*
BigInt add operation
Returns (BI_1 + BI_2)
*/
BigInt BI_add(BigInt *BI_1, BigInt *BI_2) {
    uint64_t carry;
    BigInt result = {0, 0};

    uint64_t A = BI_1->lower;
    uint64_t B = BI_2->lower;

    result.lower = A + B;

    if (result.lower < A) {
        carry = 1;
    } else {
		carry = 0; // robustness
	}

    A = BI_1->upper;
    B = BI_2->upper;

    result.upper = A + B + carry;

    return result;
}

/*
BigInt greater than comparison
Returns true if first BigInt is greater
*/
bool BI_greater_than(BigInt *a, BigInt *b) {
	if (a->upper == b->upper)
		return (a->lower > b->lower);
	else
		return (a->upper > b->upper);
}

/*
BigInt equals comparison
Returns true if BigInts are equal
*/
bool BI_equals(BigInt *a, BigInt *b) {
	return (a->upper == b->upper) && (a->lower == b->lower);
}

/*
Modulus operation for BigInt type
Returns (big_int % modulus) as a BigInt
*/
BigInt BI_mod(BigInt *big_int, BigInt *modulus) {
	if (BI_greater_than(big_int, modulus)) {
		BigInt double_mod = BI_add(modulus, modulus);
		*big_int = BI_mod(big_int, &double_mod);
	}

	while (BI_greater_than(big_int, modulus) || BI_equals(big_int, modulus))
		*big_int = BI_sub(big_int, modulus);

	return *big_int;
}

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
int count_num_bits(uint64_t value) {
    int count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
    }
    return count;
}

/*
Montgomery Modular Multiplication algorithm
Using BigInt type to store T values
Returns result of X * Y given N largest key size (modulus)
*/
uint64_t MMM(uint64_t X, uint64_t Y) {
	BigInt T = {0, 0};
	BigInt T_fake = {0, 0};
	uint8_t m = count_num_bits(N);
	
	for ( uint64_t i = 0; i < m; i++ ) {
		bool nu = BI_get_bit(&T, 0) ^ ((X & (1ULL << i)) && (Y & 1));
		uint64_t A = ((X & (1ULL << i)) >> i)*Y;
		uint64_t B = (nu*N);
		BigInt BI_A = BI_to_BigInt(A);
		BigInt BI_B = BI_to_BigInt(B);
		T = BI_add(&T, &BI_A);
		T = BI_add(&T, &BI_B);
		BI_shift_right(&T);
	}
	
	BigInt big_N = BI_to_BigInt(N);
	if (T.upper > 0 || T.lower >= N) {
		T = BI_sub(&T, &big_N);
	} else {
	    T_fake = BI_sub(&T, &big_N);
	}

	for(int i = 0; i < m; i++)
		BI_shift_left(&T);

	BI_mod(&T, &big_N);
	
	return T.lower;
}

/*
Right-to-Left Multiply and Square algorithm using MMM
Returns RSA-encrypted/decrypted message
*/
uint64_t RTL_MME(uint64_t msg, uint64_t exp) {
	uint64_t t = msg;
	uint64_t r = 1;
	uint64_t r_fake =  1;

	random_delay(0, 1);
	
	for (int i = 0; i < BIT_SIZE; i++) {
		if (exp & (1ULL << i)) {
			r = MMM(r, t) % N;
		} else {
			r_fake = MMM(r, t) % N;
		}

		random_delay(0, 1);
		
		t = MMM(t, t) % N;
	}

	random_delay(0, 1);

    return r;
}

int main() {
    srand(time(NULL));

	// 0x00bd6e6540601a366d 65537 0x0ecb1641043dab89
	// 0x00bcf5701d1ef5203f 65537 0x7af79a6a2ac5f5b9
	// 0x00cd23e220bbdecc0d 65537 0x5646b034493f6ba1
	// 0x00e0bb6374abbae903 65537 0x49d163a63697ab01
	// 0x00b7c8c8c94b84a82b 65537 0x7edb7c23b226e3c9
	N = 0x00bd6e6540601a366d;
	D = 0x0ecb1641043dab89; // private key 
	uint64_t msg = N >> 1;

	clock_t encr_start, encr_stop, decr_start, decr_stop;

	printf("\n----------------------- TESTING ENCRYPTION -----------------------\n");
	printf("N: %lu\t E: %lu\t D: %lu\t msg: %lu\n", N, E, D, msg);
	for(int i = 0; i < 3; i++) {
		printf("\tRound %i:\n", i+1);
		
		encr_start = clock();
		uint64_t encr_msg = RTL_MME(msg, E);
		encr_stop = clock();
		printf("\t\tEncrypted Message: %llu\n", encr_msg);
		printf("\t\tElapsed time: %i ms\n", (encr_stop - encr_start)/(CLOCKS_PER_SEC / 1000));

		
		decr_start = clock();
		uint64_t decr_msg = RTL_MME(encr_msg, D);
		decr_stop = clock();
		printf("\t\tDecrypted Message: %llu\n", decr_msg);
		printf("\t\tElapsed time: %i ms\n", (decr_stop - decr_start)/(CLOCKS_PER_SEC / 1000));
		
	}
	printf("------------------------------------------------------------------\n");

    return 0;
}
