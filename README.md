## Problem 1: Multiples of 3 and 5
> If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
>
> Find the sum of all the multiples of 3 or 5 below 1000.

A problem of calculating the sum of an arithmetic sequence.

## Problem 2: Even Fibonacci numbers
> Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
>
> 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
>
> By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

By observing the fibonacci sequence, we can easily conclude that the sum of the even-valued terms is *(S'-(2+1))/2+2*, where *S'* is the sum of the Fibonacci sequence up to the largest even-valued term that does not exceed four million.

> 3,5,8,&nbsp;&nbsp;13,21,34,&nbsp;&nbsp;55,89,144...

Let *F(n)* to be the nth term in the Fibonacci sequence, and *S(n)* to be the sum of the first n terms. Knowing *F(n) = F(n+2) - F(n+1)*, we can deduce that

```
S(0) = F(0)
     = F(2) - F(1)

S(1) = F(1) + F(0)
     = F(3) - F(2) + F(2) - F(1)
     = F(3) - F(1)

S(2) = F(2) + F(1) + F(0)
     = F(4) - F(3) + F(3) - F(2) + F(2) - F(1)
     = F(4) - F(1)

S(n) = F(n) + F(n-1) + ... + F(0)
     = F(n+2) - F(n+1) + F(n+1) - F(n) + ... + F(2) - F(1)
     = F(n+2) - F(1)
```

Let *F(n')* to be the largest even-valued item that does not exceed four million. The solution to this problem would be

```
S'' = (S' - (2 + 1)) / 2 + 2
    = (F(n'+2) - F(1) - (2 + 1)) / 2 + 2
```

## Problem 3: Largest prime factor
> The prime factors of 13195 are 5, 7, 13 and 29.
>
> What is the largest prime factor of the number 600851475143?

Knowing that 'Every composite number has a prime factor less than or equal to its square root', let *n* to be the subject of factorization, we can start doing trial division within the range <img src="https://render.githubusercontent.com/render/math?math=[3,\sqrt{n}]">. Let *a* to the first factor we find, then the largest proper factor *b* would be *n / a*. Let *b* to the new *n*, iterate over the process until we fail to find a factor within the range, then *n* would be the largest prime factor.

## Problem 4: Largest palindrome product
> A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
>
> Find the largest palindrome made from the product of two 3-digit numbers.

Small problem size, use brute force.

## Problem 5: Smallest multiple
> 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
>
> What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

<img src="https://render.githubusercontent.com/render/math?math=lcm(a,b)=\frac{a \cdot b}{gcd(a,b)}">

## Problem 6: Sum square difference
> The sum of the squares of the first ten natural numbers is,
>
> <img src="https://render.githubusercontent.com/render/math?math=1^2 %2B 2^2 %2B ... %2B 10^2 = 385">
>
> The square of the sum of the first ten natural numbers is,
>
> <img src="https://render.githubusercontent.com/render/math?math=(1 %2B 2 %2B ... %2B 10)^2 = 55^2 = 3025">
>
> Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
>
> Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

<img src="https://render.githubusercontent.com/render/math?math=D_n=S_{n}^2-r_{2}(n)=\big(\frac{n(n%2B1)}{2}\big)^2-\frac{n(n%2B1)(2n%2B1)}{6}">

## Problem 7: 10001st prime
> By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
>
> What is the 10 001st prime number?

Apply the [sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes).
