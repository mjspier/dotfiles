" Configuration file for vim by Manuel Spierenburg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" set working directory to current file
set autochdir

" turn off modeline support because of vulnerabilitie 
set modelines=0
set nomodeline

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set history=1000    " remember more commands and search history
set undolevels=1000 " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep
set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set conceallevel=0

"  no backup files
set nobackup 
set noswapfile

" pathogen: bundle manager
call pathogen#infect()
call pathogen#helptags()

" Enable filetype plugins
filetype plugin on
filetype indent on

set clipboard=unnamedplus " set linux clipboard


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OS X
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go+=a
vmap <C-c> "+y

func! SetupOSX()
    let g:pdf_viewer=open       " set open command as pdf viewer
    set clipboard+=unnamed
endfunc

if has("unix")
    let g:uname = system("uname")
    if g:uname == "Darwin"
        call SetupOSX()
    endif
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" style 
set encoding=utf-8
set nospell 
:map <F5> :setlocal spell! spelllang=en_gb<CR>
set number          " always show line numbers
set ruler           " always show current position

" font
set gfn=Menlo:h11
if has("gui_gtk2")
    set gfn=Monospace\ 11
endif


" show whitespaces
" exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
" set list


" colorscheme
set t_Co=256
colorscheme wombat256mod
"set background=dark

" control
set mouse=a
set lazyredraw      " don't redraw while executing macros (better performance)


" Turn on the wild menu 
set wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code

" open new splits where I want them
set splitbelow
set splitright

" intending and tabs
set expandtab 		" use spaces when tab
set smarttab 		" be smart when using tabs
set shiftwidth=4    " an intend is four spaces
set tabstop=4       " a tab is four spaces
set autoindent      " always set auto indenting on
set smartindent 	" use smart indent 
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
vnoremap < <gv      " keep focus if intend
vnoremap > >gv

" searches
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set magic 			" set magic on (normal regex)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" hardcore mode: prevent arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" treat long lines as break lines
nnoremap j gj
nnoremap k gk
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tab switching remapping
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
"map <C-S>} :tabnext

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -bar -nargs=0 SudoW :silent exe “write !sudo tee % >/dev/null” | silent edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting
syntax on

" use skeleton files when new file is created
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

" use Todo command to find 
command! Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Correct intend for whole document
func! Format()
endfunc


" tab completion
"set omnifunc=syntaxcomplete#Complete
"set completeopt+=longest
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabSetDefaultCompletionType = "<c-x><c-u>"
"let g:SuperTabClosePreviewOnPopupClose = 1

" syntasic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nmap <silent> <F7> :SyntasticCheck<CR> :SyntasticToggleMode<CR>


" ctrlp options: https://github.com/kien/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'   " current working path
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_user_command = 'find %s -type f'         

" nerdtree settings
map <C-n> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeIgnore = ['\.pyc$','\.o$']


" Setting vim airline
set laststatus=2

" setting screen 
nmap <C-c><C-a> :ScreenShellAttach<cr>
nmap <C-c><C-c> :ScreenSend<cr>
vmap <C-c><C-c> :ScreenSend<cr>

" TComment
nmap <C-c> :TComment<CR>

" ctags
let g:autotagDisabled = 1
let g:autotagTagsFile = '.tags'
nmap <silent> <F8> :TagbarToggle<CR>
let Tlist_Use_Right_Window   = 1
" nnoremap <C-\> :pop<cr>
nmap <C-c><C-]> <C-w><C-]><C-w>T 

" mac specific config
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        "        let g:ScreenShellServerName = 'mvim -v'
        let w:tex_file =  system("grep -lZ '\\documentclass' *.tex")[:-2]
    endif
endif

" PYTHON "
""""""""""
func! SetupPython()
    let g:autotagDisabled = 0
    let g:syntastic_python_checkers=['flake8']
    set foldmethod=indent
    set foldnestmax=2
    set foldlevelstart=30
    set foldlevel=99
    set nosmartindent             " smart indent doesn't handle comments nice in python
    set colorcolumn=80
    highlight ColorColumn ctermbg=gray
    let NERDTreeIgnore = ['\.pyc$']    
    let g:pep8_map='<leader>8'
    set tags=./tags;$HOME
    
    nnoremap <buffer> K :<C-u>execute "!pydoc " . expand("<cword>")<CR>

endfunc
au BufRead,BufNewFile *.py,*.pyw call SetupPython() 


" CSS "
"""""""
"let g:cssColorVimDoNotMessMyUpdatetime = 1
func! SetupCss()
    set omnifunc=csscomplete#CompleteCSS
    let g:cssColorVimDoNotMessMyUpdatetime = 1
    "call SuperTabDefaultCompletionType("<c-x><c-o>")
endfunc
au BufRead,BufNewFile *.css call SetupCss() 

" LATEX "
"""""""""
func! SetupTex()
    colorscheme blackboard
    set filetype=tex
    let g:tex_conceal = ""
    set conceallevel=0
    " set wrap
    " set textwidth=80
    " set relativenumber
    set shiftwidth=2
    " params 
    let g:TexAuto = 0
    set errorformat=%f:%l:\ %m
    let w:tex_file =  system("grep -l '\\documentclass' *.tex")[:-2]
    let w:pdf_file =  system("grep -l '\\documentclass' *.tex |  sed 's/.tex/.pdf/'")[:-2]
    let w:log_file =  system("grep -l '\\documentclass' *.tex |  sed 's/.tex/.log/'")[:-2]
    let g:NERDTreeIgnore=['\.aux$','\.log$','\.maf$','\.mtc','\.toc$','\.synctex\.gz$','\.blg$','\.fdb_latexmk','\.fls$','\.bbl$']    

    " check if latexmk is available
    if executable("latexmk") != 1
        echoerr " latexmk not installed "
    endif

    "let &makeprg="pdflatex\ \-shell\-escape\ \-file\-line\-error\ \-interaction=batchmode\ \-synctex=1\ " . w:tex_file . "\ 1\>\/dev\/null "
    "let &makeprg="latexmk\ \-silent\ \-pdf\ \-pdflatex=\"pdflatex\ \-shell\-escape\ \-file\-line\-error\\"\ " . w:tex_file
    "let &makeprg="latexmk\ \-silent\ \-pdf\ " . w:tex_file . "\ 1\>\/dev\/null "
    let &makeprg="latexmk\ \-silent\ \-bibtex\ \-pdf\ " . w:tex_file . "\ 1\>\/dev\/null "

    function! Compile()
        " Remove the '| cw' if you do not like the quickfix window
        silent make | silent redraw! | cw
    endfunction

    function! AutoCompile()
        if g:TexAuto == 1
            call Compile()
        endif
    endfunction

    function! SetManual()
        let g:TexAuto = 0
    endfunction

    function! OpenPDF()
        " open with gnome-open
        if executable("gnome-open")
            silent execute "!gnome-open\ " . w:pdf_file . "\ 2>/dev/null" | redraw!
        elseif executable("evince")
            silent execute "!evince\ " . w:pdf_file . "\ &" | redraw!
        elseif executable("open")
            silent execute "!open\ " . w:pdf_file . "\ &" | redraw!
        else
            echoerr " no pdf viewer found"
        endif
    endfunction

    " commands for latex
    command! TexClean execute "!latexmk\ -C"
    command! TexCompile call Compile()
    command! TexManual let g:TexAuto=0
    command! TexAuto let g:TexAuto=1
    " open pdf with pdf viewer
    command! TexView call OpenPDF()
    " show Warnings
    command! TexWarn noautocmd vimgrep /Warning\|FIXME/j *.log | cw

    nnoremap <leader>ll :TexCompile <CR>

    autocmd BufWritePost * call AutoCompile()
endfunc

au BufRead,BufNewFile *.tex call SetupTex() 

func! SetupCpp()
    nnoremap gr :grep <cword> *<CR>
    let g:autotagDisabled = 0
    set tags=./.tags;$HOME
endfunc

au BufRead,BufNewFile *.c call SetupCpp() 
