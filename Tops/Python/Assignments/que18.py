#18)Write a Python program to count occurrences of a substring in a string. 

string = input("Enter the main string: ")
substring = input("Enter the substring to count: ")
count = string.count(substring)
print(f"The substring '{substring}' appears {count} times in the main string.")