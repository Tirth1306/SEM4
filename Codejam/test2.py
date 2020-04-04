import random as rn
x = rn.randint(1000,2000)
print(x)
for i in range(x):
    s = ''
    for i in range(rn.randint(1,101)):
        s += str(rn.randint(0,1))
    print(s)