fibPair :: (Int, Int) -> Int -> (Int, Int)
fibPair (x, y) limit =
    if y > limit
        then (x, y)
        else fibPair (y, x + y) limit

main =
    let fib0 = 1
        fib1 = 2
        limit = 4000000
        (x, y) = fibPair (fib0, fib1) limit
        sum = (div (x + y - fib1 - (fib0 + fib1)) 2) + fib1

    in putStrLn (show sum)
