test_cases = int(input())

for _ in range(test_cases):
    C = 0
    J = 0
    n = int(input())
    ans = [ '' for p in range(n)]

    tasks = []

    for i in range(n):
        start, end = list(map(int, input().split(' ')))
        tasks.append((start,end,i))

    tsk_cpy = tasks.copy()
    tsk_cpy.sort(key=lambda x:x[0])

    for start, end, i in tsk_cpy:
        if C <= start:
            C = end
            ans[i] = 'C'
        elif J <= start:
            J = end
            ans[i] = 'J'
        else:
            ans = 'IMPOSSIBLE'
            break

    if ans == 'IMPOSSIBLE':
        print("Case #{:d}: {:s}".format(_ + 1, ans))
    else:
        print("Case #{:d}: {:s}".format(_ + 1, "".join(ans)))
