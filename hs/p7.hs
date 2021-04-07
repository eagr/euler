import qualified Data.Sequence as Seq
import Data.Maybe

iSqrt :: Int -> Int
iSqrt = floor . sqrt . fromIntegral

sift :: Seq.Seq Bool -> Int -> Int -> Int -> Int -> Seq.Seq Bool
sift seq limit hi i j =
    if i >= hi
        then seq
        else
            if j <= limit
                then
                    if fromJust (Seq.lookup j seq)
                        then sift (Seq.update j False seq) limit hi i (j + i)
                        else sift seq limit hi i (j + i)
                else sift seq limit hi (i + 1) ((i + 1) * (i + 1))

isPrimeSeq :: Int -> Seq.Seq Bool
isPrimeSeq 0 = Seq.fromList [False]
isPrimeSeq 1 = Seq.fromList [False, False]
isPrimeSeq 2 = Seq.fromList [False, False, True]
isPrimeSeq 3 = Seq.fromList [False, False, True, True]
isPrimeSeq limit
    | limit < 0 = isPrimeSeq 0
    | otherwise =
        let hi      = (iSqrt limit) + 1
            i       = 3
            j       = i * i
            initSeq =
                if mod limit 2 == 0
                    then (isPrimeSeq 2) Seq.>< (Seq.fromList (take (limit - 2) (cycle [True, False])))
                    else (isPrimeSeq 3) Seq.>< (Seq.fromList (take (limit - 3) (cycle [False, True])))
        in sift initSeq limit hi i j

nthPrime'' :: Seq.Seq Bool -> Int -> Int -> Int -> Int
nthPrime'' s n c i
    | c == n = i - 1
    | otherwise = if fromJust (Seq.lookup i s)
        then nthPrime'' s n (c + 1) (i + 1)
        else nthPrime'' s n c (i + 1)

nthPrime' :: Int -> Int -> Int
nthPrime' n limit
    | n >= (div limit ((floor (log (fromIntegral limit))) + 1)) = nthPrime' n (limit * 2)
    | otherwise = nthPrime'' (isPrimeSeq limit) n 0 0

nthPrime :: Int -> Int
nthPrime n = nthPrime' n n

main = print $ nthPrime 10001
