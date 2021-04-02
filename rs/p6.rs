fn square_of_sum(n: u128) -> u128 {
    let sum = n * (n + 1) / 2;
    sum.pow(2)
}

fn sum_of_squares(n: u128) -> u128 {
    n * (n + 1) * (2 * n + 1) / 6
}

fn diff(n: u128) -> u128 {
    square_of_sum(n) - sum_of_squares(n)
}

fn main() {
    println!("{}", diff(100));
}
