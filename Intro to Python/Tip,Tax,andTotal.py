# Name : Abhishek Dhanani
# Date : 09/09/2024
# Program Title: Tip, Tax, and Total

bill = float(input("Enter your check : "))

tip = (bill*18)/100  # 18% tip
salesTax = (bill*7)/100  # 7% tax
totalBill = bill + tip + salesTax # adding intial bill,tip and tax to calculate final bill

print(f"Your total bill with {tip}$ tip and {salesTax}$ tax is {totalBill}$")
