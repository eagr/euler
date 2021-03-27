# Project Euler

## Problem 1: Multiples of 3 and 5
> If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
>
> Find the sum of all the multiples of 3 or 5 below 1000.

A problem of calculating the sum of arithmetic sequences.

## Problem 2: Even Fibonacci numbers
> Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
>
> 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
>
> By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

By observing the fibonacci sequence, we can easily conclude that the sum of the even-valued terms is **(S'-(2+1))/2+2**, where S' is the sum of the Fibonacci sequence up to the largest even-valued term that does not exceed four million.

> 3,5,8,&nbsp;&nbsp;13,21,34,&nbsp;&nbsp;55,89,144...

Let F(n) to be the nth term in the Fibonacci sequence, and S(n) to be the sum of the first n terms. We know F(n) = F(n+2) - F(n+1), from which we can make the following deduction.

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

Let F(n') to be the largest even-valued item that does not exceed four million. Then the solution to this problem would be

```
S'' = (S' - (2 + 1)) / 2 + 2
    = (F(n'+2) - F(1) - (2 + 1)) / 2 + 2
```
