fn fib_pair(pair: (u32, u32), limit: u32) -> (u32, u32) {
    let (x, y) = pair;
    if y > limit { pair }
    else { fib_pair((y, x + y), limit) }
}

fn main() {
    const FIB_0: u32 = 1;
    const FIB_1: u32 = 2;
    const LIMIT: u32 = 4000000;

    let (x, y) = fib_pair((FIB_0, FIB_1), LIMIT);
    let sum = (x + y - FIB_1 - (FIB_0 + FIB_1)) / 2 + FIB_1;

    println!("{}", sum);
}
