import os
import shutil
from tqdm import tqdm  # Import tqdm

# Set your source and target directories
source_directory = "/mnt/d/ZeroOneDiff/cooked-no-op-fmt-shift_node/"
target_directory = "/mnt/d/ZeroOneDiff/only_test/"

# Make sure that the target directory exists
os.makedirs(target_directory, exist_ok=True)

# Read prefixes from the .txt file
with open("/mnt/d/ZeroOneDiff/cooked-no-op-fmt-shift_node/test.txt", 'r') as file:
    prefixes = [line.strip() for line in file]
    prefixes = tuple(prefixes)  # Convert the list to a tuple for faster checking

# Define a set for faster lookup
prefixes_set = set(prefixes)

# Function to check if the file name starts with any of the prefixes
def has_matching_prefix(file_name, prefixes_tuple):
    return file_name.startswith(prefixes_tuple)


# Get the total number of files for the progress bar
total_files = sum(1 for _ in os.scandir(source_directory) if not _.name.startswith('.'))

# Using os.scandir() for efficient directory scanning
with os.scandir(source_directory) as it:
    # Wrap the iterator with tqdm for a progress bar
    for entry in tqdm(it, total=total_files, desc='Processing files', unit='file'):
        if not entry.name.startswith('.') and entry.is_file():
            # Check if the file name starts with any of the prefixes
            if has_matching_prefix(entry.name, prefixes):  # Use prefixes (tuple), not prefixes_set (set)
                # Construct full paths
                source_path = os.path.join(source_directory, entry.name)
                target_path = os.path.join(target_directory, entry.name)
                
                # Move the file
                shutil.move(source_path, target_path)

print("File transfer is complete.")