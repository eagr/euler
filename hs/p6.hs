squareOfSum :: Integer -> Integer
squareOfSum n = (div (n * (n + 1)) 2) ^ 2

sumOfSquares :: Integer -> Integer
sumOfSquares n = div (n * (n + 1) * (2 * n + 1)) 6

diff :: Integer -> Integer
diff n = (squareOfSum n) - (sumOfSquares n)

main = print $ diff 100
