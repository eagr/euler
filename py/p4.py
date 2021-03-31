def is_palindrome(x: int) -> bool:
    x = abs(x)

    k = 1
    y = x // 10
    while y > 0:
        k += 1
        y = y // 10

    if k <= 3:
        return x // (10 ** (k - 1)) == x % 10

    for i in range(1, k // 2 + 1):
        h = x // (10 ** (k - i)) % 10
        l = x // (10 ** (i - 1)) % 10
        if h != l:
            return False

    return True

palindrome = 0
for i in range(999, 900, -1):
    for j in range(i, 900, -1):
        prod = i * j
        if is_palindrome(prod) and prod > palindrome:
            palindrome = prod

print(palindrome)
