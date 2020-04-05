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

        # first 0 - 5 queries

        for m in range(1, 6):
            print(m)
            t = input()
            sys.stdout.flush()
            bits += t

        final_b += bits
        final_b += 'x' * 10

        # first 5 - 10 queries

        bits = ''
        for m in range(16, 21):
            print(m)
            t = input()
            sys.stdout.flush()
            bits += t

        final_b += bits

        # start of 10 onwards queries
        hist = 0
        for c, m in enumerate([1,2,3,4,5]):
            print(m)
            t = input()
            sys.stdout.flush()

            if (t == '0' and final_b[m - 1] != '1') or (t == '1' and final_b[m - 1] != '0'):
                C = False
            if (t == '0' and final_b[m - 1] != '0') or (t == '1' and final_b[m - 1] != '1'):
                Nothing = False
            if (t == '0' and final_b[20 - m] != '0') or (t == '1' and final_b[20 - m] != '1'):
                R = False
            if (t == '0' and final_b[20 - m] != '1') or (t == '1' and final_b[20 - m] != '0'):
                CR = False

            hist = c
            if [R, C, CR, Nothing].count(True) == 1:
                break


        if R:
            final_b = final_b[::-1]
        elif C:
            temp = ''
            for e in range(20):
                if final_b[e] == '0':
                    temp += '1'
                elif final_b[e] == '1':
                    temp += '0'
                else:
                    temp += 'x'
            final_b = temp
        elif CR:

            temp = ''
            for e in range(20):
                if final_b[e] == '0':
                    temp += '1'
                elif final_b[e] == '1':
                    temp += '0'
                else:
                    temp += 'x'
            final_b = temp[::-1]

        k = 6
        final_b = [i for i in final_b]
        for i in range(hist + 1,10):
            print(k)
            t = input()
            sys.stdout.flush()
            final_b[k-1] = t
            k+=1

        # if prev == 'R':
        #     k = 21 - k
        #     for i in range(hist + 1, 10):
        #         if k > 5:
        #             print(k)
        #             t = input()
        #             sys.stdout.flush()
        #             final_b[k -1] = t
        #             k -= 1
        # else:
        #     for i in range(hist + 1, 10):
        #         if k < 16:
        #             print(k)
        #             t = input()
        #             sys.stdout.flush()
        #             final_b[k - 1] = t
        #             k += 1

        final_b = "".join(final_b)
        prev = ''
        R = True
        C = True
        CR = True
        Nothing = True

        # end of 20 queries
        hist = 0
        for c, m in enumerate([1, 2, 3, 4, 5]):
            print(m)
            t = input()
            sys.stdout.flush()

            if (t == '0' and final_b[m - 1] != '1') or (t == '1' and final_b[m - 1] != '0'):
                C = False
            if (t == '0' and final_b[m - 1] != '0') or (t == '1' and final_b[m - 1] != '1'):
                Nothing = False
            if (t == '0' and final_b[20 - m] != '0') or (t == '1' and final_b[20 - m] != '1'):
                R = False
            if (t == '0' and final_b[20 - m] != '1') or (t == '1' and final_b[20 - m] != '0'):
                CR = False

            hist = c

            if [R, C, CR, Nothing].count(True) == 1:
                break

        if R:
            final_b = final_b[::-1]
            prev = 'R'
        elif C:
            temp = ''
            for e in range(20):
                if final_b[e] == '0':
                    temp += '1'
                elif final_b[e] == '1':
                    temp += '0'
                else:
                    temp += 'x'
            final_b = temp
        elif CR:
            prev = 'R'
            temp = ''
            for e in range(20):
                if final_b[e] == '0':
                    temp += '1'
                elif final_b[e] == '1':
                    temp += '0'
                else:
                    temp += 'x'
            final_b = temp[::-1]

        final_b = [i for i in final_b]

        if prev != 'R':
            k = 15
            for i in range(hist + 1, 10):
                if k > 5:
                    print(k)
                    t = input()
                    sys.stdout.flush()
                    final_b[k -1] = t
                    k -= 1
        else:
            k = 6
            for i in range(hist + 1, 10):
                if k < 16:
                    print(k)
                    t = input()
                    sys.stdout.flush()
                    final_b[k - 1] = t
                    k += 1

        final_b = "".join(final_b)
        print(final_b)
        k = input()
        if k != 'Y':
            exit(0)