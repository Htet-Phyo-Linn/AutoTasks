def reverse_hex_strings(hex_strings):
    reversed_hex_strings = []
    for hex_string in hex_strings:
        # Reverse each hex string by chunks of 2 characters
        reversed_hex_string = ''.join(reversed([hex_string[i:i+2] for i in range(0, len(hex_string), 2)]))
        reversed_hex_strings.append(reversed_hex_string)
    print(reverse_hex_strings)
    return reversed_hex_strings

# Read hex strings from 'array.txt'
with open('array.txt', 'r') as f:
    hex_strings = [line.strip() for line in f.readlines()]

# Reverse the hex strings
reversed_hex_strings = reverse_hex_strings(hex_strings)

# Write the reversed hex strings to 'reversedHex.txt'
with open('reversedHex.txt', 'w') as f:
    for reversed_hex_string in reversed_hex_strings:
        f.write(reversed_hex_string + '\n')

