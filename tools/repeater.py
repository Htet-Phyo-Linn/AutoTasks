# Function to get input from the user and repeat it
def repeat_string():
    # Get the string input from the user
    text = input("Enter the text you want to repeat: ")

    # Get the number of times to repeat the text
    while True:
        try:
            count = int(input("How many times do you want to repeat it? "))
            if count < 0:
                print("Please enter a positive number.")
            else:
                break
        except ValueError:
            print("Please enter a valid number.")

    # Repeat the string and print the result
    repeated_text = text * count
    print(repeated_text)

# Call the function
repeat_string()

