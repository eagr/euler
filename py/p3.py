import math
from typing import Optional

def largest_proper_factor(x: int) -> Optional[int]:
    hi = math.floor(math.sqrt(x))
    for i in range(2, hi + 1):
        if x % i == 0:
            return int(x / i)

def largest_prime_factor(x: int) -> int:
    i = x
    j = largest_proper_factor(i)

    while j is not None:
        i = j
        j = largest_proper_factor(i)

    return i

NUM = 600851475143
print(largest_prime_factor(NUM))
