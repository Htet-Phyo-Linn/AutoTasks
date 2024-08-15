# Read the hexadecimal values from the file and store them in an array

# Define the filename
filename = 'reversedHex.txt'

# Initialize an empty list to store the hexadecimal values
hex_array = []

# Open the file and read its contents
with open(filename, 'r') as file:
    # Read the entire file content
    content = file.read().strip()
    # Split the content by commas to get individual hex values
    hex_values = content.split(', ')
    # Append each hex value to the array
    hex_array.extend(hex_values)



# Print the array
print(hex_array)


# Convert the character array to a string
string_result = ''.join(hex_array)

# Print the resulting string
#print(string_result)


reversed_array = hex_array[::-1]

# Convert the reversed array to a string
reversed_string = ''.join(reversed_array)

# Print the resulting string
print(reversed_string)


# Write the string to final.txt
with open('final.txt', 'w') as file:
    file.write(reversed_string)

print("Data has been written to final.txt")
