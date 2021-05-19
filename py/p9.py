import math
from typing import Tuple

def triple_from_sum(sum: int) -> Tuple[int, int, int]:
    hs = sum // 2
    for m in range(2, math.ceil(math.sqrt(hs))):
        if hs % m == 0:
            for mn in range(m + 1 + (m%2), 2 * m, 2):
                if hs % mn == 0:
                    n = mn - m
                    d = hs // (m * mn)
                    a = (m*m - n*n) * d
                    b = 2 * m * n * d
                    c = (m*m + n*n) * d
                    return a, b, c
    return 0, 0, 0

s = 1000
a, b, c = triple_from_sum(s)
print(a * b * c)
