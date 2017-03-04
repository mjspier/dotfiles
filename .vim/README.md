Superbly VIM Config
===================


Installed plugins
-----------------

+ AutoComplPop
+ ctrlp
+ nerdtree
+ vim-nerdtree-tabs
+ indentLine
+ snipmate 
+ tcomment
+ [vim-surround](https://github.com/tpope/vim-surround)
+ vim-css-color
+ [screen](https://github.com/ervandew/screen)
+ [vim-autotag](https://github.com/craigemery/vim-autotag)



Quick tip
---------

```
# open files
:e file      # open file in buffer
:tabnew file # open file in new tab
:old         # list recent files

# windows
ctrl+w, s    # open horizontal split
ctrl+w, v    # open vertical split

# move
ctrl+o  # got to previous position
ctrl+i  # jump forward to position
:jump   # show jump list

# tabs
ctrl+right # open tab to the right 
ctrl+left  # open tab to the left 
:tabm +1   # move tab to the right
:tabm -1   # move tab to the left

# search 
F4      # grep word under cursor
shift+8 # forward search word under cursor
shift+3 # backward search word under cursor

# nerdtree
ctrl+n  # togglet nerdtree
I       # show hidden files
t       # open in new tab
s       # open in vertical split
i       # open in horizontal split

# coding
ctrl+_ ctrl+_ # comment

# formatting
ggV=G             # format indentions in whole file
:!column -t       # (unix command) nicely format columns


# surround
cs'<q>  # change single quotes to q tag
cst"    # change tags to double quotes
ysiw]   # surround word with brackets
yss)    # surround line with parantheses

# screen 
:ScreenShellAttach # attach to running screen session

# tags
F8              # toggle tagbar
ctrl+]          # go to definition
ctrl+t          # go back to caller
ctrl+w ctrl+]   # open def in horizontal split
ctrl+c ctrl+]   # open tag in new tab
ctrl+w shift+]  # preview tag 
:tag name       # go to definition
:ts             # list definition of last tag

# syntax check
F7              # check python against pep8

# spell check
F5              # activate spell check
]s              # next missspelled word
[s              # forward missspelled word
z=              # suggest word

# quckfix
:ccl            # close quickfix
:copen          # open quickfix

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
