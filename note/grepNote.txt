"$" or "^" = exactly 
"*" = zero or more-time

ls | wc -l /usr/share/dict/words

grep -i '^computer' /usr/share/dict/words



Common options and examples:

1. **Search for a pattern in a single file:**
   ```
   grep "pattern" filename.txt
   ```

2. **Search for a pattern in multiple files:**
   ```bash
   grep "pattern" file1.txt file2.txt file3.txt
   ```

3. **Search for a pattern in all files in a directory (using wildcard):**
   ```bash
   grep "pattern" /path/to/directory/*
   ```

4. **Case-insensitive search:**
   ```bash
   grep -i "pattern" filename.txt
   ```

5. **Display line numbers with matching lines:**
   ```bash
   grep -n "pattern" filename.txt
   ```

6. **Search recursively in subdirectories:**
   ```bash
   grep -r "pattern" /path/to/directory/
   ```

7. **Search for lines that do NOT match a pattern:**
   ```bash
   grep -v "pattern" filename.txt
   ```

8. **Count the number of matching lines:**
   ```bash
   grep -c "pattern" filename.txt
   ```

These are just some of the basic `grep` usage examples. It's a versatile tool that can be combined with other commands to perform more complex text processing tasks in Linux.
