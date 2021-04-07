import math
from typing import List

def is_prime_seq(limit: int) -> List[bool]:
    prefix = [False, False, True, True]
    if limit < len(prefix):
        return prefix[:limit+1]

    seq = prefix[0:3] + [True, False] * ((limit - 2) // 2) if limit % 2 == 0 else \
          prefix + [False, True] * ((limit - 3) // 2)

    hi = math.floor(math.sqrt(limit + 1)) + 1
    for i in range(3, hi, 2):
        j = i * i
        while j < limit:
            if seq[j]:
                seq[j] = False
            j += i

    return seq

def nth_prime(n: int) -> int:
    n = max(n, 1)
    limit = n
    while n >= limit // (math.log(limit) + 1):
        limit *= 2

    seq = is_prime_seq(limit)
    count = 0
    for i in range(len(seq)):
        if seq[i]:
            count += 1
        if count == n:
            return i

    return 0

print(nth_prime(10001))
