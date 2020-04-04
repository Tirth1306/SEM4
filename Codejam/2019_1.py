test_cases = int(input())

ans = []
for _ in range(test_cases):
    n = int(input())
    arr = []
    trace = 0
    rw = 0
    cl = 0
    x = list(range(n))
    arr = []
    arrT = []

    for b in range(n):
        arrT.append([])

    for i in range(n):
        row = list(map(int,input().split(' ')))
        trace += row[i]
        arr.append(row)

        for j in range(n):
            arrT[j].append(row[j])

    for i in range(n):
        if len(set(arr[i])) != len(arr[i]):
            rw += 1
        if len(set(arrT[i])) != len(arrT[i]):
            cl += 1

    ans.append("Case #{:d}: {:d} {:d} {:d}".format(_ + 1, trace, rw, cl))

for _ in ans:
    print(_)
