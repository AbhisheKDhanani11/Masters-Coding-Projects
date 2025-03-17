# Name : Abhishek Dhanani
# Date : 11/04/2024
# Program Title: word frequency counter

counter = {}  # dictionary for storing the count if every word
with open("words.txt",'r') as file_obj:  # opening file
    file_content = file_obj.read().split()  # using split to store every word

for i in range(0, len(file_content)):  # loop for counting every word
    word = file_content[i].lower()  # making every word in lower case, so every word counts
    if word in counter:  # if the word is in our dic then increase the counter
        counter[word] += 1
    else:  # if it's a new word then create a new key with that word and set its count by 1
        counter[word] = 1

for word, count in counter.items():  # displaying every word and its count
    print(f"{word}: {count}")
