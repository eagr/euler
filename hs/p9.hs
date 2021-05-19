main =
    let s = 1000
        (a, b, c) = tripleFromSum s
    in print $ a * b * c

tripleFromSum :: Int -> (Int, Int, Int)
tripleFromSum s = tripleFromSum' s 2 3

tripleFromSum' :: Int -> Int -> Int -> (Int, Int, Int)
tripleFromSum' s m mn =
    let hs = div s 2 in
        if m < ceilingSqrt hs
            then if mod hs m == 0
                then if mn < 2 * m
                    then if mod hs mn == 0
                        then
                            let n = mn - m
                                d = div hs (m * mn)
                                a = (m * m - n * n) * d
                                b = 2 * m * n * d
                                c = (m * m + n * n) * d
                            in (a, b, c)
                        else tripleFromSum' s m (mn + 2)
                    else tripleFromSum' s (m + 1) (m + 2 + (mod (m + 1) 2))
                else tripleFromSum' s (m + 1) (m + 2 + (mod (m + 1) 2))
            else (0, 0, 0)

ceilingSqrt :: Int -> Int
ceilingSqrt = ceiling . sqrt . fromIntegral
