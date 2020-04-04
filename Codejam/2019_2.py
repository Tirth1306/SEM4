test_cases = int(input())

ans = []
for _ in range(test_cases):
    sp = input()
    k = [int(i) for i in sp]
    h = k[0]
    s = ''
    r = ''

    for i, num in enumerate(k):
        j = 0
        f = 0
        if i == 0:
            s += ('(' * num)
            r += (')' * num)
            s += str(num)
            h = num
            continue
        elif num == h:
            s += str(num)
            continue
        elif num < h:
            f = 0
            s += r[:h - num]
            r = r[h - num:]
            h = num
            s += str(num)
            continue
        elif num > h:
            f = 1

        if f == 1:
            z = num - h
        else:
            z = num

        s += ('(' * z)
        r += (')' * z)

        s += str(num)
        h = num
    s += r
    ans.append(s)

for i,j in enumerate(ans):
    print("Case #{:d}: {:s}".format(i+1,j))
