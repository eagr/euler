use std::cmp;

fn gcd(x: u64, y: u64) -> u64 {
    if x == 0 && y == 0 { panic!("the numbers cannot both be 0") }
    else if x == 0 { y }
    else if y == 0 { x }
    else {
        let l = cmp::max(x, y);
        let mut s = cmp::min(x, y);
        let mut r = l % s;

        if r == 0 { s }
        else {
            while r > 0 {
                let rem = s % r;
                s = r;
                r = rem;
            }
            s
        }
    }
}

fn lcm(x: u64, y: u64) -> u64 {
    if x == 0 || y == 0 { 0u64 } else { x * y / gcd(x, y) }
}

fn last_in_seq(first: u64, limit:u64) -> u64 {
    if first >= limit { panic!("`first` must be less than `limit`") }

    let mut last = limit - 1;
    while last % first != 0 {
        last -= 1;
    }
    last
}

fn sum_of_arith_seq(first: u64, last: u64) -> u64 {
    (first + last) * (last / first) / 2
}

fn main() {
    let x = 3u64;
    let y = 5u64;
    let limit = 1000u64;

    let m = lcm(x, y);

    let lx = last_in_seq(x, limit);
    let ly = last_in_seq(y, limit);
    let lm = last_in_seq(m, limit);

    let mut sum = 0;
    sum += sum_of_arith_seq(x, lx);
    sum += sum_of_arith_seq(y, ly);
    sum -= sum_of_arith_seq(m, lm);

    println!("{}", sum);
}
