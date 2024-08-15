def getHex(input_file, output_file):
    with open(input_file, 'rb') as f:
        # Read binary data from the input file
        hex_data = f.read()
    
    # Convert binary data to hex string
    file_hex = hex_data.hex()

    with open(output_file, 'w') as f:
        # Write the hex string to the output file
        f.write(file_hex)

# Define input and output file names
input_file = 'challengefile'
output_file = 'analyze.txt'

# Convert binary file to hex and save it
getHex(input_file, output_file)

with open(output_file, 'r') as f:
    # Read the hex data
    data = f.read()

# Split the hex string into chunks of 8 characters
array_data = [data[i:i+8] for i in range(0, len(data), 8)]

# Join chunks with a comma and space
result = ', '.join(array_data)

with open('array.txt', 'w') as f:
    # Write the formatted result to the output file
    f.write(result)
