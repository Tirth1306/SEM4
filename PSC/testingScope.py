a = 10

def outer():
    a = 20

    def inner():
        a=30
        print(a)

    print(a)
    inner()
    print(a)

print(a)
outer()
print(a)
