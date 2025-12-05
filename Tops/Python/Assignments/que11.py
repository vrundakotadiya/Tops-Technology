#11) Write a Python program to test whether a passed letter is a vowel or not.

letter = input("Enter a letter:-")
if letter in 'aeiouAEIOU':
    print(letter, "is a vowel")
else:
    print(letter, "is not a vowel") 
