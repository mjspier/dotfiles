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



Quick tip
---------

```sh
# move
ctrl+o  # got to previous position
ctrl+i  # jump forward to position
:jump   # show jump list

# search 
F4      # grep word under cursor
shift+3 # highlifht word under cursor

# nerdtree
ctrl+n  # togglet nerdtree
I       # show hidden files
t       # open in new tab
s       # open in vertical split
i       # open in horizontal split

# surround
cs'<q>  # change single quotes to q tag
cst"    # change tags to double quotes
ysiw]   # surround word with brackets
yss)    # surroudn line with parantheses

# screen 
:ScreenShellAttach # attach to running screen session

# tags
F8              # toggle tagbar
ctrl+]          # go to definition
ctrl+\          # open definition in tab
ctrl+w ctrl+]   # open def in horizontal split
ctrl+c ctrl+]   # open tag in new tab
:tag name       # go to definition
:ts             # list definition of last tag

# syntax check
F7              # check python against pep8

# quckfix
:ccl            # close quickfix
:copen          # open quickfix

```


Latex
-----

Searches for file with `\\documentclass` (master file) in same folder and tries to compile this.
If several files with `\\documentclass` exist in same folder, will not work.
Uses latexmk for compile

```sh
# commands
:TexCompile     # create pdf of latex
:TexAuto        # auto compile with every save (default on)
:TexManuel      # disable auto compile
:TexClean       # remove intermediate files (latexmk -c)
:TexView        # opens pdf 
:TexWarn        # show warning in quick window
```
