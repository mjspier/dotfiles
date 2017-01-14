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
