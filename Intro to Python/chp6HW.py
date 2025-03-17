# Name : Abhishek Dhanani
# Date : 10/22/2024
# Program Title: file handiling

with open("Numbers.txt",'r') as num:
    total = 0.0
    print("Content in the file:")
    for i in num:
        print(i)
        total += float(i)
    print(f"The total of the number in file is: {total}")