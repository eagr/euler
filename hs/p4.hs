base :: Integer
base = 10

thresh :: Int
thresh = 100

numDigits' :: Int -> Integer -> Int
numDigits' acc x =
    let y = abs x in
        if x < base
            then acc
            else numDigits' (acc + 1) (div x base)

numDigits :: Integer -> Int
numDigits = numDigits' 1

isPalindromicNum :: Integer -> Bool
isPalindromicNum x =
    let k = numDigits x in
        if k <= 3
            then let e = base ^ (k - 1) in div x e == mod x base
            else isPalindrome (show x)

isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome xs = head xs == last xs && isPalindrome (init (tail xs))

findMaxPalindromicNum :: Integer -> Integer -> Integer -> Integer
findMaxPalindromicNum i j max =
    let prod = i * j
        newMax = if isPalindromicNum prod && prod > max then prod else max
    in
        if j > 900
            then findMaxPalindromicNum i (j - 1) newMax
            else if i > 900
                then findMaxPalindromicNum (i - 1) (i - 1) newMax
                else newMax

main = print $ findMaxPalindromicNum 999 999 0
