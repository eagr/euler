fn largest_proper_factor(x: u128) -> u128 {
    let sqrt = (x as f64).sqrt().floor() as u128;
    for i in (3..sqrt + 1).step_by(2) {
        if x % i == 0 {
            return x / i
        }
    }
    x
}

fn largest_prime_factor(x: u128) -> u128 {
    let mut y = x;
    while y % 2 == 0 {
        if y == 2 { return 2 }
        y /= 2;
    }

    let mut i = y;
    let mut j = largest_proper_factor(i);
    while i > j {
        i = j;
        j = largest_proper_factor(i);
    }

    i
}

fn main() {
    const NUM: u128 = 600851475143;
    println!("{}", largest_prime_factor(NUM));
}
