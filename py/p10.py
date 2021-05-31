import math
from typing import List

def sieve_up_to(limit: int) -> List[bool]:
    if limit <= 3:
        return [False]

    max_odd = limit - 1 - (limit % 2)
    sieve = [False] + [True] * (max_odd // 2)
    cross = math.floor(math.sqrt(max_odd)) // 2 + 1

    for i in range(1, cross):
        if sieve[i]:
            for j in range(2*i*(i+1), len(sieve), 2*i+1):
                sieve[j] = False

    return sieve

def sum_of_primes(sieve: List[bool]) -> int:
    sum = 2
    for i in range(len(sieve)):
        if sieve[i]:
            sum += 2 * i + 1
    return sum

limit = 2000000
print(sum_of_primes(sieve_up_to(limit)))
