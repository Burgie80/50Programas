import os

filenames = []

def read_and_write_files(parent_folder, file_extension, output_file):
	# Walk through the parent folder
	for root, _, files in os.walk(parent_folder):
		# Filter files by the given extension
		for file in files:
			if file.endswith(file_extension):
				file_path = os.path.join(root, file)
				print(f"Reading file: {file_path}")
				filenames.append(file)

	filenames.sort(key=lambda x: int(x.split('_')[0][1:]))

	with open('Makefile', 'w') as output_file:
		for file in filenames:
			output_file.write(f"run_{file.split('_')[0]}:\n")
			output_file.write(f"\t$(SWIPL) -s {file} -g main -t halt;\n\n")
	print(filenames)

# Example usage
parent_folder = "."
file_extension = ".pl"  # Specify the desired extension
output_file = "output.txt"

read_and_write_files(parent_folder, file_extension, output_file)

