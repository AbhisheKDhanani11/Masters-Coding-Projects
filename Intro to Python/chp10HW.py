# Name : Abhishek Dhanani
# Date : 11/14/2024
# Program Title: working with class

class employee:  # employee class

    def __init__(self):  # class constructor which initialise these vars while obj creation
        self.name = ""
        self.id_num = 000
        self.dep = ""
        self.job_title = ""

    def insert(self, Name, id, dep, job):  # insert method to insert employee details
        self.name = Name
        self.id_num = id
        self.dep = dep
        self.job_title = job

    def display(self):  # method to display the details of employee
        print(f"Name: {self.name}\nID Num: {self.id_num}\nDepartment: {self.dep}\nJob Title: {self.job_title}\n")


# creating class obj for individual employee
emp1 = employee()
emp2 = employee()
emp3 = employee()

# using insert method of class to enter employee details
emp1.insert("Susan Meyers", 47899, "Accounting", "Vice President")
emp2.insert("Mark Jones", 39119, "IT", "Programmer")
emp3.insert("Joy Rogers", 81774, "Manufacturing", "Engineer")

# using display method to show employee details
emp1.display()
emp2.display()
emp3.display()
