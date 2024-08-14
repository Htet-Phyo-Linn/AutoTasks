import os
import subprocess

def generate_hex_dump(file_path, output_path):
    """Generate a hex dump for a file using xxd and save it to output_path."""
    try:
        with open(output_path, 'w') as output_file:
            subprocess.run(['xxd', file_path], stdout=output_file)
        print(f"Hex dump saved to {output_path}")
    except Exception as e:
        print(f"Error generating hex dump for {file_path}: {e}")

def generate_hex_dumps_for_directory(input_directory, output_directory):
    """Generate hex dumps for all files in the input_directory and save them to output_directory."""
    # Ensure the output directory exists
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # Iterate over all files in the input directory
    for filename in os.listdir(input_directory):
        file_path = os.path.join(input_directory, filename)
        
        # Ensure it's a file
        if os.path.isfile(file_path):
            output_file_name = f"{filename}.hex"
            output_path = os.path.join(output_directory, output_file_name)
            generate_hex_dump(file_path, output_path)

# Directory containing the original files
input_directory = "Brotherhood"  # Replace with your folder path

# Directory where hex dump files will be saved
output_directory = "bro"  # Replace with your desired output folder path

# Generate hex dumps for all files in the input directory
generate_hex_dumps_for_directory(input_directory, output_directory)

