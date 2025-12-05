#14)Write a python program to sum of the first n positive integers. 

n = int(input("Enter a positive integer: "))
if n <= 0:
    print("Please enter a positive integer greater than 0.")
else:
    total = n * (n + 1) // 2
    print(f"The sum of the first {n} positive integers is: {total}")
