x = []

t = int(input())

for _ in range(t):
    x.append(int(input()))

x.sort(reverse=True)
for i in range(t):
    x[i] *= (i+1)

print(max(x))