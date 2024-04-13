import numpy as np

# Replace 'your_file.npy' with the path to your .npy file
file_path = '/mnt/d/eval_dump_folder/1704855435_001125_dump.npy'

# Load the file
data = np.load(file_path, allow_pickle=True)

# Print the contents
print(data)