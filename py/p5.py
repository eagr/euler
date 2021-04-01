def gcd(x: int, y: int) -> int:
    if x == 0 and y == 0:
        raise ValueError("gcd(0,0) is undefined")
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
    return x * y // gcd(x, y)

start = 1
end = 20
mul = 1
for i in range(start, end + 1):
    mul = lcm(mul, i)

print(mul)
