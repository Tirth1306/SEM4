def isTidy(n):
    for _ in range(len(n)-1):
        if n[_] > n[_+1]:
            return False
    return True

t = int(input())

for _ in range(t):
    num = input()
    ans = ""

    if isTidy(num):
        print("Case #{:d}: {:d} {:d}".format(_ + 1, int(num), int(num)))
        continue

    l = len(num)

    if (l == 1):
        print("Case #{:d}: {:d} {:d}".format(_+1 ,int(num), int(num)))
        continue
    else:
        for i in range(l - 1):
            if num[i] <= num[i + 1]:
                ans += num[i]
            else:
                if  i== 0 or num[i] != '1':
                    ans += str(int(num[i]) - 1)
                    ans += '9' * (l - i - 1)
                    print("Case #{:d}: {:d} {:d}".format(_+1,int(num),int(ans)))
                    break
                else:
                    ans += '9' * (l - i - 1)
                    while num[i] > '1':
                        print(ans)
                        i -= 1
                        ans[i] -= 1
                        ans[i+1] = '9'
                        print("Case #{:d}: {:d} {:d}".format(_+1,int(num),int(ans)))
                        break
                    break
