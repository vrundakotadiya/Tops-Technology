# 6)Write a Python program to get the Fibonacci series of given range. 

num = int(input("Enter the number:-"))
a=0
b=1
print("fibonacci series:")
for i in range(num):
    print(a,end=" ")
    a,b=b,a+b