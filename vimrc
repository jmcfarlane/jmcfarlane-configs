set ai                              " Autoindent what I've indented myself
set expandtab                       " Replace tabs with the of spaces
set hidden
set incsearch                       " Do incremental searching
set listchars=trail:.,tab:>-,eol:$  " What characters to show with F2
set nocompatible                    " Use vim defaults
set shiftwidth=4                    " Number of spaces per (auto) indent
set softtabstop=4                   " Use spaces as tab for BACKSPACE/DELETE
set tabstop=4                       " Number of spaces per tab
set textwidth=70                    " Wrap safely at an 80 char margin
set title                           " Show title
set nobackup                        " I hate vim swp files
set ruler                           " Show the ruler all the time
set rulerformat=%l/%L(%p%%),%c      " A better ruler
set showmatch                       " show matching brackets
set showmode                        " display mode (INSERT/REPLACE/etc.)
set guifont=Liberation\ Mono\ 9     " Liberation Mono size 9
set nopaste                         " Don't use ai when pasting
set guioptions-=T                   " Don't show the gvim toolbar

" Bash (+extra) style file tab completion
set wildmenu
set wildmode=longest,list,full

" Don't clutter my dirs up with swp and tmp files
set backupdir=/tmp
set directory=/tmp

map <silent> <F2> :set invlist<CR>		" Show/hide hidden Chars
map <silent> <F3> :cn<CR>	            " Next match in the QuickList
map <silent> <F4> :set invhlsearch<CR>	" Show/hide found pattern
map <silent> <F5> :source ~/.vimrc<CR>	" Reload .vimrc
map <silent> <F6> :set nonumber!<CR>	" Show/hide line numbers
map <silent> <F8> gwap                  " Format paragraph
map <C-Tab> :bn<CR>
map <S-C-Tab> :bp<CR>
map <silent> ,h :w !python<CR>

" Special settings:
au BufRead,BufNewFile *.c,*.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.conf,*.css,*.json,*.js,*.tpl,*.tmpl set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.html,*.rst,*.xml,*.xhtml,*.xsl set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.schema set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.py set sw=4 sts=4 ts=4
au BufRead,BufNewFile *.clj set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.yml set sw=2 sts=2 ts=2

" Syntax highlighting tweaks
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.js set ft=javascript

" Colors
colorscheme evening
syntax on

" Automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
autocmd BufWritePre * :call StripTrailingWhitespace()

" Let's stop being so old and crufty
call pathogen#infect()
call pathogen#helptags()

" Leader
let mapleader = ","

" Python stuff
filetype plugin indent on

" https://github.com/guns/vim-clojure-static.git
let g:clojure_maxlines = 1000
let g:clojure_fuzzy_indent_patterns = "with.*,def.*,let.*,testing"

" ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,target,*/build/*
map <Leader>bb :CtrlPBuffer<CR>
map <Leader>f :CtrlP .<CR>
map <Leader>p :CtrlP<CR>

" syntastic
" sudo apt-get install python-pep8 python-pyflakes
let g:syntastic_python_checkers = ['pep8', 'pyflakes', 'python']

" https://github.com/kien/rainbow_parentheses.vim.git
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
