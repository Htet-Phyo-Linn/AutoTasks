## Grep Command

```bash
grep [options] pattern [file...]
```

### Common Pattern List
1. **\$ or \^ = Include** 
	```bash
	grep '^computer' /usr/share/dict/words
	
	grep '$computer' /usr/share/dict/words
	```

2. **\* = Zero or more times**
	```bash 
	grep 'computer*' /usr/share/dict/words 
	```

3. **\\\| = One or two word** 
	```bash
   grep "pattern\|computer" /usr/share/dict/words
	```

4. **"\." = Find between** 
	```bash 
	grep "com.er" /usr/share/dict/words
	```
	
5. **Search email** 
	```bash 
	grep "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}" filename.txt

	```
	
* * *
### Common options and examples:

1. **Search for a pattern in a single file:**
   ```bash
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

