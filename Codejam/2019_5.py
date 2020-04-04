test_cases = int(input())

for _ in range(test_cases):
    n,k = list(map(int,input().split()))

    # if n%2 != 0 and k%n != 0:
    #     print("Case {:d}: IMPOSSIBLE".format(_+1))
    #     continue
    # elif n%2 == 0 and k%(n/2)!=0:
    #     print("Case {:d}: IMPOSSIBLE".format(_ + 1))
    #     continue

    # if n%2 != 0 and k%n != 0:
    if n % 2 != 0 and k % n == 0:
        i = int(k/n)

        matrix = []
        for u in range(n):
            matrix.append([(i+q-u - 1)%(n) + 1 for q in range(n)])

        print("Case {:d}: POSSIBLE".format(_ + 1))
        for i in range(n):
            for j in range(n):
                print("{:d}".format(matrix[i][j]), end=' ')
            print()
        continue

    # if n%2 == 0:
    else:
        i = int(k/n)

        if i == k/n:
            matrix = []
            for u in range(n):
                matrix.append([(i + q - u - 1) % (n) + 1 for q in range(n)])

            print("Case {:d}: POSSIBLE".format(_ + 1))
            for i in range(n):
                for j in range(n):
                    print("{:d}".format(matrix[i][j]), end=' ')
                print()
            continue
        else:
            pad = k - (i*n)
            trace = [i for y in range(n)]

            if pad <= (n/2):
                for o in range(int(n/2)):
                    # print(trace)
                    trace[o] += 1
                    if pad != 0:
                        pad -= 1
                    else:
                        trace[n-o-1] -=1
            else:
                w = pad % int(n/2)
                for k in range(w):
                    if trace[k] + 2 <= n:
                        trace[k] +=2
                        pad -= 2
                    else:
                        trace[k] += 1
                        pad -= 1

                # print(trace)
                # print(pad)
                lk = pad
                for o in range(lk):
                    trace[int(n/2) + o] += 1
                    if pad == 0:
                        trace[n - o - 1] -= 1
                    else:
                        pad -= 1

            # print(trace)
            if 0 in trace or trace.count(n) > int(n/2):
                print("Case {:d}: IMPOSSIBLE".format(_ + 1))
                continue
            else:

                matrix = []
                for f, u in zip(trace, range(n)):
                    matrix.append([(f + q - u - 1) % (n) + 1 for q in range(n)])

                print("Case {:d}: POSSIBLE".format(_ + 1))
                for i in range(n):
                    for j in range(n):
                        print("{:d}".format(matrix[i][j]), end=' ')
                    print()
                continue




