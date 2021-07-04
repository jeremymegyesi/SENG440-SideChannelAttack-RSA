#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

// preset primes
#define P 13
#define Q 11
#define MAX_K 100000


bool is_valid_K(uint32_t k, uint32_t R) {
    // assert k > R
    if ( k <= R )
        return false;
    // assert k mod R = 1
    if ( (k % R) != 1 )
        return false;
    
    // ensure k, R are relatively prime and k isn't prime
    bool is_prime_k = true;
    for ( int i = 2; i < k; i++ ) {
        if ( (k%i == 0) && (R%i == 0) )
            return false;
        if ( k%i == 0 )
            is_prime_k = false;
    }

    return !is_prime_k;
}

void compute_keys(uint32_t *D, uint32_t *E, uint32_t N, uint32_t R) {
    // generate options for K = 1 mod R
    uint32_t max_options = (MAX_K / R) + 1;
    uint32_t *options = (uint32_t *) (malloc( max_options * sizeof(uint32_t) ));
    uint32_t k_count = 0;
    for ( int option = R + 1; option < MAX_K; option += R ) {
        if ( is_valid_K(option, R) ) {
            options[k_count] = option;
            k_count++;
        }
    }

    // randomly select K value from available options
    uint32_t rand_index = rand() % k_count;
    uint32_t K = options[rand_index];
    free(options);
    printf("K VALUE: %i\n", K);

    // select factors for D, E
    uint32_t *factors = (uint32_t *) (malloc(  K * sizeof(uint32_t) ));
    uint32_t factor_count = 0;
    for ( int factor = 2; factor < K; factor++ ) {
        if (factor*factor == K) {
            factors[factor_count] = factor;
            factor_count++;
            factors[factor_count] = factor;
            factor_count++;
        }
        else if (K%factor == 0) {
            factors[factor_count] = factor;
            factor_count++;
        }
    }
    uint32_t index_d = rand() % factor_count;
    *D = factors[index_d];
    uint32_t index_e = rand() % factor_count;
    if (index_e == index_d)
        index_e = (index_e + 1) % factor_count;
    *E = factors[index_e];
    free(factors);
}

int main() {
    srand(time(NULL));
    uint32_t N = P*Q;
    uint32_t R = (P-1)*(Q-1);

    uint32_t D, E;
    compute_keys(&D, &E, N, R);
    printf("Public Key (D): %i\n", D);
    printf("Private Key (E): %i\n", E);
    return 0;
}
