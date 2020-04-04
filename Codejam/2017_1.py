t = int(input())

for _ in range(t):
    temp, k = input().split(' ')
    k = int(k)

    temp = temp.replace('+','1')
    temp = temp.replace('-', '0')
    N = len(temp)
    num = int(temp , 2)

    fpr = 2**k -1

    i = N - k
    c = 0
    while i >= 0:
        if ( (1 << (i+k-1)) & num == 0 ):
            num = num ^ (fpr << i)
            c += 1
        # print("{:d} : {:b}".format(i,num))
        i -= 1

    if(num == 2**N - 1):
        print("Case #{:d}: {:d}".format(_+1,c))
    else:
        print("Case #{:d}: IMPOSSIBLE".format(_+1))
