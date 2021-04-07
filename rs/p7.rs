fn is_prime_seq(limit: usize) -> Vec<bool> {
    let prefix = vec![false, false, true, true];
    if limit < prefix.len() {
        return prefix[..prefix.len()].to_vec();
    }

    let mut seq = if limit % 2 == 0 {
        [
            prefix[..=2].to_vec(),
            [true, false].repeat((limit - 2) / 2),
        ].concat()
    } else {
        [
            prefix.to_vec(),
            [false, true].repeat((limit - 3) / 2),
        ].concat()
    };

    let hi = (((limit + 1) as f32).sqrt() as usize) + 1;
    for i in (3..hi).step_by(2) {
        let mut j = i * i;
        while j < limit {
            if seq[j] {
                seq[j] = false;
            }
            j += i;
        }
    }

    seq
}

fn nth_prime(n: usize) -> usize {
    let mut limit = std::cmp::max(n, 1);
    while n >= limit / (((limit as f32).ln() as usize) + 1) {
        limit *= 2;
    }

    let seq = is_prime_seq(limit);
    let mut count = 0;
    for (i, &b) in seq.iter().enumerate() {
        if b {
            count += 1;
        }
        if count == n {
            return i
        }
    }
    0
}

fn main() {
    println!("{}", nth_prime(10001));
}
