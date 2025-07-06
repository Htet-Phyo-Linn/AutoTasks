
#!/bin/sh

# Move all files from subdirectories to current dir (main)
# Rename if file already exists: file.jpg -> file0.jpg, file1.jpg, etc.

target_dir="."

# Find all files in subfolders (depth ≥ 2)
find . -mindepth 2 -type f | while IFS= read -r filepath; do
    filename=$(basename "$filepath")
    base="${filename%.*}"
    ext="${filename##*.}"
    dest="$target_dir/$filename"

    # If file exists, find a unique name
    if [ -e "$dest" ]; then
        i=0
        while [ -e "$target_dir/${base}${i}.${ext}" ]; do
            i=$((i + 1))
        done
        dest="$target_dir/${base}${i}.${ext}"
    fi

    echo "Moving: $filepath → $dest"
    mv "$filepath" "$dest"
done
