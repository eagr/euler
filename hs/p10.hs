import qualified Data.Sequence as Seq
import Data.Maybe (fromJust)

main =
    let limit = 2000000
        sieve = sieveUpTo limit
        sum = sumOfPrimes sieve
    in print $ sum

sieveUpTo :: Int -> Seq.Seq Bool
sieveUpTo limit
    | limit <= 3 = Seq.fromList [False]
    | otherwise =
        let maxOdd = limit - 1 - (mod limit 2)
            length = (div maxOdd 2) + 1
            cross = (div (iSqrt maxOdd) 2) + 1
            sieve = Seq.fromList (take length (cycle [True]))
            i = 1
            j = 2 * i * (i + 1)
        in makeSieve (Seq.update 0 False sieve) cross length i j

iSqrt :: Int -> Int
iSqrt = floor . sqrt . fromIntegral

makeSieve :: Seq.Seq Bool -> Int -> Int -> Int -> Int -> Seq.Seq Bool
makeSieve sieve cross length i j =
    if i < cross
        then if fromJust (Seq.lookup i sieve)
            then if j < length
                then makeSieve (Seq.update j False sieve) cross length i (j + (2*i+1))
                else makeSieve sieve cross length (i + 1) (2 * (i^2 + 3*i + 2))
            else makeSieve sieve cross length (i + 1) (2 * (i^2 + 3*i + 2))
        else sieve

sumOfPrimes :: Seq.Seq Bool -> Integer
sumOfPrimes sieve =
    let fn = \sum i isPrime -> if isPrime then sum + (2 * (toInteger i) + 1) else sum
    in Seq.foldlWithIndex fn 2 sieve
