#9)Write python program that swap two number with temp variable and without temp variable. 

#With Temp Variable:
a=int(input("Enter first number:"))
b=int(input("Enter second number:"))

print("Before swap: a=" ,a, "b=",b)
temp=a
a=b
b=temp
print("After swap: a=",a, "b=",b)

#Without Temp Variable:

a = int(input("Enter first number: "))
b = int(input("Enter second number: "))

print("Before swap: a =", a, "b =", b)
a, b = b, a
print("After swap: a =", a, "b =", b)