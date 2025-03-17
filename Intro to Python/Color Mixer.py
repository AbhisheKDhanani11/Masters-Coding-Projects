# Name : Abhishek Dhanani
# Date : 09/18/2024
# Program Title: Color Mixer

first_color = input("Enter first color: ") # user enters name of first color
second_color = input("Enter second color: ") # # user enters name of second color

# conditions for mixing colurs
if first_color == "red" and second_color == "blue":
    print(f"After mixing {first_color} and {second_color} you will get Purple color.")
elif first_color == "red" and second_color == "yellow":
    print(f"After mixing {first_color} and {second_color} you will get Orange color.")
elif first_color == "blue" and second_color == "yellow":
    print(f"After mixing {first_color} and {second_color} you will get Green color.")
else: # if user enters other than red,blue, yellow it will display error message
    print("You have entered wrong color to mix")
