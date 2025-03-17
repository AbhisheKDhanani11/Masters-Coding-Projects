# Name : Abhishek Dhanani
# Date : 09/24/2024
# Program Title: Pennies for Pay

first_day_sal = 1.0 # setting the first day salary to 1 penny
salary = 0.0 # salary for each day
total = 0.0 # subtotal after end of the period
days = int(input("Enter number of days: ")) # getting number of days from user
print("Day\t\tsalary") # for table
for i in range(1,days + 1): # starting the loop with 1 and ending with days + 1 so it will loop till number of days user entered
    if i == 1: # if its 1st day
        salary = first_day_sal
        total = salary
    else: # if its other than 1st day
        salary = salary * 2
        total = total + salary
    print(i,"\t\t",salary)

print(f"The total pay is {total/100}$")
