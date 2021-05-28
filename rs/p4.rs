fn is_palindrome(x: u128) -> bool {
    const BASE: u128 = 10;
    let mut y = x / BASE;
    let mut digits = 1;

    while y > 0 {
        digits += 1;
        y /= BASE;
    }

    if digits <= 3 {
        x / BASE.pow(digits - 1) == x % BASE
    } else {
        for k in 0..(digits / 2) {
            let lo = x / BASE.pow(k) % BASE;
            let hi = x / BASE.pow(digits - k - 1) % BASE;
            if lo != hi { return false; }
        }
        true
    }
}

fn main() {
    let mut max = 0;
    for i in (899..1000).rev() {
        for j in (899..i).rev() {
            let prod = i * j as u128;
            if is_palindrome(prod) && prod > max {
                max = prod
            }
        }
    }
    println!("{}", max);
}
