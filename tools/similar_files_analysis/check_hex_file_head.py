import os
import itertools
from multiprocessing import Pool, cpu_count

def read_file_head(file_path, num_lines=10):
    """Read and return the first num_lines lines of a file."""
    try:
        with open(file_path, 'r') as file:
            head = ''.join([file.readline() for _ in range(num_lines)])
        return head
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return None

def compare_file_heads(file1_path, file2_path, num_lines=10):
    """Compare the heads of two files and return True if they are identical."""
    head1 = read_file_head(file1_path, num_lines)
    head2 = read_file_head(file2_path, num_lines)
    
    if head1 and head2:
        return head1 == head2  # Compare the heads
    return False

def compare_pair(pair):
    """Compare a pair of hex file heads and return the pair if they are identical."""
    file1_path, file2_path, num_lines = pair
    print(f"Comparing {os.path.basename(file1_path)} with {os.path.basename(file2_path)}...")
    if compare_file_heads(file1_path, file2_path, num_lines):
        return pair
    return None

def compare_all_pairs(directory, num_lines=10):
    """Compare all pairs of hex file heads in a directory and return a list of identical pairs."""
    files = [os.path.join(directory, f) for f in os.listdir(directory) if f.endswith('.hex')]
    unique_pairs = [(file1, file2, num_lines) for file1, file2 in itertools.combinations(files, 2)]  # Generate unique pairs, avoiding duplicates

    total_pairs = len(unique_pairs)
    print(f"Total pairs to compare: {total_pairs}")

    # Use multiprocessing to compare files in parallel
    with Pool(cpu_count()) as pool:
        results = []
        for i, result in enumerate(pool.imap(compare_pair, unique_pairs), 1):
            if result:
                results.append(result)
            print(f"Progress: {i}/{total_pairs} pairs compared.")
    
    # Filter out None results and return the list of identical pairs
    identical_pairs = [(os.path.basename(file1), os.path.basename(file2)) for file1, file2, _ in results if file1 and file2]
    return identical_pairs

# Directory containing the .hex files
directory = "test/"  # Replace with your folder path

# Number of lines to compare from the head of each file
num_lines_to_compare = 10  # Adjust as needed

# Compare all pairs of hex file heads in the directory
identical_pairs = compare_all_pairs(directory, num_lines=num_lines_to_compare)

# Output the results
if identical_pairs:
    identical_files = [f"{file1} and {file2}" for file1, file2 in identical_pairs]
    print(f"Script run successful! Identical files: {', '.join(identical_files)}")
else:
    print("Script run successful! No identical files found.")

