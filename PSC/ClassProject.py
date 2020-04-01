str = input("Enter the string to check: ").lower()

def isPalindrome(str):
    str = list(str)
    if(len(str) > 1 and str[0] == str[len(str)-1]):
        str.pop() and str.pop(0)
        return isPalindrome(str)
    else:
        return False
    return True

print(isPalindrome(str))
