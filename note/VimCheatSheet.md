## Move

h    j    k  l

left down up right

***

## Should know

- `:w` = save
- `:wq` = save and exit
- `:q!` = don't save and exit
  
- `u` = undo
- `5u` = undo 5 changes
- `ctrl+R` = redo
- `zz` = view center

- `:set number` = jump line
- `.` = repeat last operation

- `ctrl+space` = autocomplete (vscode)
- `shift+i` = select multiple line and insert multiple line (vscode)
- `shift+j` = combine line 1 and line 2 
  
***

## Input session

- `i` = insert
- `o` = insert new line
- `O` = insert above new line 
- `I` = insert ( Before Line )
- `A` = Append ( After Line )
- `p` = paste the buffer after the cursor
- `P` = paste the buffer before the cursor
- `IiaA` = insert place

- `v` = normal select
- `shift+v` = select line (visual line)
- `ctrl+v` = manual select (visual block)

***

## Delete session

- `x` = delete char
- `d` = delect selected
- `dd` = delete line
- `dw` = delete word
- `D` = delete rest of line
- `d4w` = delete four words
- `c` = delete one char and then go insert mode

***

## Jump session

- `gg` = beginning of file
- `G` = end of file
- `$` = end of line
- `0` = beginning of line

- `W,B` = go line word start and end
- `w` = jump to next words
- `b` = jump to previous word

***

## Replace and change

- `r` = replace letter
- `R` = replace words
- `cw` = change word
- `8w` = jump eight word after ther cursor
- `c7w` = change 7 words

***

## Example 

```
for (i=0, i++, i<10){
	array=[]
}

```



### Looping section

- `ci(` = change inner parentheses
- `ci)` = change inner parentheses
- `ci[` = change inner brackets
- `ci]` = change inner brackets
- `ci{` = change inner brackets
- `ci}` = change inner brackets
- `%` = jump to start and stop
- `c%` = change until bracket

- `>` = select and right tab
- `<` = select and left delete tab
- `=` = indent

***

## Next level cmd

- `gg=G` = indent whole file
- `ggdG` = delete whole file

- `/word` = search for word
- `n` = next occurrence
- `N` = previous occurrence

- `#` = previous token occurrence
- `+` = next token occurrence

- `:s/old/new/g` = replace old word to new word globally
- `:%s/old/new/g` = replace everywhere

- `:colorscheme name` = select theme

- `:set tabstop=4` = tab width to four
- `:set autoindent` = auto inentation
- `:set mouse=a` = active mouse
- `:set mouse=""` = deactive mouse

***
