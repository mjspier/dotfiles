Superbly VIM Config
===================


Installed plugins
-----------------

+ AutoComplPop
+ ctrlp
+ nerdtree
+ vim-nerdtree-tabs
+ indentLine
+ tcomment
+ [vim-surround](https://github.com/tpope/vim-surround)
+ [screen](https://github.com/ervandew/screen)
+ [vim-autotag](https://github.com/craigemery/vim-autotag)
+ [vim-snipmate](https://github.com/garbas/vim-snipmate)
+ [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git)
+ [tlib_vim](https://github.com/tomtom/tlib_vim.git)
+ [vim-snippets](https://github.com/honza/vim-snippets.git)




Quick tip
---------

```
# open files
:e file         # open file in buffer
:tabnew file    # open file in new tab
:old            # list recent files

# windows
ctrl+w, s       # open horizontal split
ctrl+w, v       # open vertical split
ctrl+w, shift+t # change split to tab
:sb <n>         # open buffer n in horizontal split
:vertical sb <n># open buffer n in vertical split

# move
ctrl+o          # got to previous position
ctrl+i          # jump forward to position
:jump           # show jump list

# tabs
ctrl+right      # open tab to the right 
ctrl+left       # open tab to the left 
:tabm +1        # move tab to the right
:tabm -1        # move tab to the left
:tabo           # close all other tabs

# search 
F4              # grep word under cursor
shift+8         # forward search word under cursor
shift+3         # backward search word under cursor

# nerdtree
ctrl+n          # togglet nerdtree
I               # show hidden files
t               # open in new tab
s               # open in vertical split
i               # open in horizontal split

# coding
ctrl+_ ctrl+_   # comment

# folds
zR              # open all folds
zM              # close all folds

# formatting
ggV=G           # format indentions in whole file
:!column -t     # (unix command) nicely format columns


# surround
cs'<q>          # change single quotes to q tag
cst"            # change tags to double quotes
ysiw]           # surround word with brackets
yss)            # surround line with parantheses

# tmux 
<c-c><c-c>      # send to tmux session

# tags
F8              # toggle tagbar
ctrl+]          # go to definition
ctrl+t          # go back to caller
ctrl+w ctrl+]   # open def in horizontal split
ctrl+c ctrl+]   # open tag in new tab
ctrl+w shift+]  # preview tag 
:tag name       # go to definition
:ts             # list definition of last tag

# cscope        
ctrl+\ s        # show usage of word under cursor
ctrl+space s    # show usage in split screen (horizontal)
ctrl+2xspace s  # show usage in split screen (vertical)
:cscope foo     # find symbol foo


# syntax check
F7              # syntax checker toggle mode 

# spell check
F6              # activate spell check
]s              # next missspelled word
[s              # forward missspelled word
z=              # suggest word

# quckfix
:ccl            # close quickfix
:copen          # open quickfix
F9              # toggle quickfix


# vimdiff
vimdiff file1 file2
]c              # go to next change
[c              # go to previous change
:diffget        # optain change from other file
:diffput        # put change to other file


# ctrlp
ctrl+p          # open ctrlp
ctrl+b          # switch between modes

```

Latex
-----

Searches for file with `\\documentclass` (master file) in same folder and tries to compile this.
If several files with `\\documentclass` exist in same folder, will not work.
Uses latexmk for compile

```
# commands
:TexCompile     # create pdf of latex
:TexAuto        # auto compile with every save (default on)
:TexManuel      # disable auto compile
:TexClean       # remove intermediate files (latexmk -c)
:TexView        # opens pdf 
:TexWarn        # show warning in quick window

# keys
<leader>ll      # compile document
```

Python
------

```
K               # open pyhton doc for word under cursor
```
