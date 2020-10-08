lastInSeq :: Int -> Int -> Int
lastInSeq first limit
    | first >= limit    = error "`first` cannot be greater than `limit`"
    | otherwise         = let last = limit - 1 in (if mod last first == 0 then last else lastInSeq first last)

sumOfArithSeq :: Int -> Int -> Int
sumOfArithSeq first last = (div ((first + last) * (div last first)) 2)

main =
    let x = 3
        y = 5
        limit = 1000

        m = lcm x y
        lx = lastInSeq x limit
        ly = lastInSeq y limit
        lm = lastInSeq m limit
        sum = (sumOfArithSeq x lx) + (sumOfArithSeq y ly) - (sumOfArithSeq m lm)

    in putStrLn (show sum)
