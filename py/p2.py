FIB_0 = 1
FIB_1 = 2

# fibs to the first item that exceeds the soft limit
def fib_seq(limit: int) -> int:
    fibs = [FIB_0, FIB_1]
    while (fibs[-1] <= limit):
        fibs.append(fibs[-2] + fibs[-1])
    return fibs

LIMIT = 4000000
fibs = fib_seq(LIMIT)
sum = (fibs[-2] + fibs[-1] - FIB_1 - (FIB_0 + FIB_1)) / 2 + FIB_1
sum = int(sum)

print(sum)
