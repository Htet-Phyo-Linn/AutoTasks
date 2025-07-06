#!/bin/bash

maxdepth="$1"

if [ -n "$maxdepth" ]; then
  maxdepth_opt="-maxdepth $maxdepth"
else
  maxdepth_opt="-maxdepth 1"
fi

# Total files
total_files_count=$(find . $maxdepth_opt -type f | wc -l)
total_files_size=$(find . $maxdepth_opt -type f -exec stat -c%s {} + 2>/dev/null | awk '{s+=$1} END{print s}')
total_files_size_hr=$(numfmt --to=iec --suffix=B --padding=7 "$total_files_size")

# Total folders
total_folders_count=$(find . $maxdepth_opt -mindepth 1 -type d | wc -l)
total_folders_size=$(find . $maxdepth_opt -mindepth 1 -type d -exec du -sb {} + 2>/dev/null | awk '{s+=$1} END{print s}')
total_folders_size_hr=$(numfmt --to=iec --suffix=B --padding=7 "$total_folders_size")

echo "Total files: $total_files_count ($total_files_size_hr)"
echo "Total folders: $total_folders_count ($total_folders_size_hr)"
echo ""

printf "Count\tSize\tExtension\n"

# Process files by extension
find . $maxdepth_opt -type f | while read -r file; do
    basefile=$(basename "$file")
    ext="${basefile##*.}"

    # POSIX-safe check for extension
    case "$basefile" in
        *.*) 
            if [ "$ext" = "$basefile" ]; then
                ext="unknown"
            else
                ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
            fi
            ;;
        *) ext="unknown" ;;
    esac

    size=$(stat -c%s "$file" 2>/dev/null || stat -f%z "$file")  # fallback for BSD/macOS
    printf "%s\t%s\n" "$ext" "$size"
done | awk -F '\t' '
{
    count[$1]++
    size[$1]+=$2
}
END {
    for (e in count)
        printf("%d\t%d\t%s\n", count[e], size[e], e)
}' | sort -k3 | while read c s e; do
    sh_size=$(numfmt --to=iec --suffix=B --padding=7 "$s")
    printf "%d\t%s\t%s\n" "$c" "$sh_size" "$e"
done
