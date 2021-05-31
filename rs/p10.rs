fn main() {
    const LIMIT: usize = 2000000;
    let sieve = sieve_up_to(LIMIT);
    let sum = sum_of_primes(&sieve);
    println!("{}", sum);
}

fn sieve_up_to(limit: usize) -> Vec<bool> {
    if limit <= 3 {
        vec![false]
    } else {
        let max_odd = limit - 1 - (limit % 2);
        let length = max_odd / 2 + 1;
        let cross = ((max_odd as f64).sqrt().floor() as usize) / 2 + 1;

        let mut sieve = vec![true; length];
        sieve[0] = false;
        for i in 1..cross {
            if sieve[i] {
                for j in ((2 * i * (i + 1))..length).step_by(2*i+1) {
                    sieve[j] = false
                }
            }
        }
        sieve
    }
}

fn sum_of_primes(sieve: &Vec<bool>) -> u128 {
    sieve.into_iter().enumerate().fold(2u128, |s, (i, is_prime)| if *is_prime {
        s + 2 * (i as u128) + 1
    } else {
        s
    })
}
