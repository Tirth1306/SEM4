import math

t = int(input())


def Z(n):
    ans = 0
    p = 1

    while( n >= math.pow(5,p)):
        ans += math.floor( n/ math.pow(5,p))
        p += 1

    print(ans)


for _ in range(t):
    Z(int(input()))
