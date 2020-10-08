def gcd(x: int, y: int) -> int:
    if x == 0 and y == 0:
        raise ValueError("the numbers cannot both be 0")
    if x == 0:
        return y
    if y == 0:
        return x

    l = max(x, y)
    s = min(x, y)
    r = l % s
    if r == 0:
        return s

    while r > 0:
        rem = s % r
        s, r = r, rem
    return s

def lcm(x: int, y: int) -> int:
    if x == 0 or y == 0:
        return 0
    else:
        return x * y / gcd(x, y)

def last_in_seq(first: int, limit: int) -> int:
    if first >= limit:
        raise ValueError("`first` must be smaller than `limit`")

    last = limit - 1
    while last % first != 0:
        last -= 1
    return last

def sum_of_arith_seq(first: int, last: int) -> int:
    return (first + last) * (last / first) / 2

x = 3
y = 5
limit = 1000

m = lcm(x, y)

lx = last_in_seq(x, limit)
ly = last_in_seq(y, limit)
lm = last_in_seq(m, limit)

sum = 0
sum += sum_of_arith_seq(x, lx)
sum += sum_of_arith_seq(y, ly)
sum -= sum_of_arith_seq(m, lm)
sum = int(sum)

print(sum)
