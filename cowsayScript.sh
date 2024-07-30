# Specify the directory path
directory_path="/usr/share/cowsay/cows"

# Store filenames in an array
file_list=()

# Loop through filenames in the directory and add them to the array
for file in "$directory_path"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")  # Extract only the filename
        filename_no_extension="${filename%.*}"  # Remove file extension
        file_list+=("$filename_no_extension")
    fi
done

# Print the list of filenames (optional)
size=${#file_list[@]}
index=$(($RANDOM % $size))

fortune | cowsay -f ${file_list[$index]}
