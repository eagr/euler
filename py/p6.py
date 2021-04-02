def square_of_sum(n: int) -> int:
    sum = n * (n+1) / 2
    return int(pow(sum, 2))

def sum_of_squares(n: int) -> int:
    return int(n * (n+1) * (2*n+1) / 6)

def diff(n: int) -> int:
    return square_of_sum(n) - sum_of_squares(n)

print(diff(100))
