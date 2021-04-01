use std::cmp;

fn gcd(x: usize, y: usize) -> usize {
    if x == 0 && y == 0 { panic!("gcd(0,0) is undefined") }
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

fn lcm(x: usize, y: usize) -> usize {
    if x == 0 || y == 0 { 0usize }
    else { x * y / gcd(x, y) }
}

fn main() {
    let start = 1usize;
    let end = 20usize;
    let mut mul = 1usize;
    for i in start..(end + 1) {
        mul = lcm(mul, i);
    }
    println!("{}", mul);
}
