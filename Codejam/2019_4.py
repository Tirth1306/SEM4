import sys

test_cases, b = list(map(int, input().split()))

for _ in range(test_cases):
    if b == 10:
        bits = ''
        for m in range(1, 11):
            print(m)
            t = input()
            sys.stdout.flush()
            bits += t

        print(bits)
        k = input()
        if k != 'Y':
            exit(0)

    elif (b == 20):
        final_b = ''
        bits = ''
        R = True
        C = True
        CR = True
        Nothing = True
        handshake = ''

        for m in range(1, 11):
            print(m)
            t = input()
            sys.stdout.flush()
            bits += t

        final_b += bits

        for m in range(1, 11):
            print(m)
            t = input()
            sys.stdout.flush()

            if (t == '0' and bits[m - 1] != '1') or (t == '1' and bits[m - 1] != '0'):
                C = False
            if (t == '0' and bits[m - 1] != '0') or (t == '1' and bits[m - 1] != '1'):
                Nothing = False
