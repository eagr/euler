use std::cmp;

fn main () {
    let s = 1000;
    let triple = triple_from_sum(s);
    match triple {
        (a, b, c) => println!("{}", a * b * c),
    }
}

fn triple_from_sum(s: u64) -> (u64, u64, u64) {
    let hs = s / 2;

    // exactly one of m, n is even and gcd(m,n) = 1
    for m in 2..(hs as f64).sqrt().ceil() as u64 {
        if hs % m == 0 {
            for mn in ((m + 1 + (m % 2))..(2 * m)).step_by(2) {
                if hs % mn == 0 && gcd(m, mn) == 1 {
                    let n = mn - m;
                    let d = hs / (m * mn);
                    let a = (m * m - n * n) * d;
                    let b = 2 * m * n * d;
                    let c = (m * m + n * n) * d;
                    return (a, b, c);
                }
            }
        }
    }
    (0, 0, 0)
}

fn gcd(x: u64, y: u64) -> u64 {
    if x == 0 && y == 0 { panic!("the numbers cannot both be zero") }
    else if x == 0 { y }
    else if y == 0 { x }
    else {
        let l = cmp::max(x, y);
        let mut s = cmp::min(x, y);
        let mut r = l % s;
        while r > 0 {
            let rem = s % r;
            s = r;
            r = rem;
        }
        s
    }
}
