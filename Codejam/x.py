import sys
test_cases, b = list(map(int, input().split()))

for _ in range(test_cases):
    final_b = ''
    bits = ''
    R = True
    C = True
    CR = True
    Nothing = True
    handshake = ''

    # if (b == 10):
    for m in range(1, 11):
        print(m)
        t = input()
        sys.stdout.flush()
        bits += t

    print(bits)
    k = input()
    if k!='Y':
        exit(0)