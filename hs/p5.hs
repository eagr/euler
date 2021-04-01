lcm'' :: Int -> Int -> Int -> Int
lcm'' mul start end
    | start == end  = lcm mul start
    | start > end   = lcm'' mul end start
    | otherwise     = lcm'' (lcm mul start) (start + 1) end

lcm' :: Int -> Int -> Int
lcm' = lcm'' 1

main = print $ lcm' 1 20
