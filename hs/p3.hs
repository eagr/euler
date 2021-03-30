iSqrt :: Int -> Int
iSqrt = floor . sqrt . fromIntegral

largestProperFactor :: Int -> Int -> Int
largestProperFactor x y =
    let r = iSqrt x
    in
    if y > r then x
        else if mod x y == 0
            then div x y
            else largestProperFactor x (y + 2)

largestPrimeFactor :: Int -> Int
largestPrimeFactor x
    | x == 2        = 2
    | mod x 2 == 0  = largestPrimeFactor (div x 2)
    | otherwise     =
        let y = largestProperFactor x 3
        in
        if y < x
            then largestPrimeFactor y
            else x

main = let num = 600851475143 in putStrLn (show (largestPrimeFactor num))
