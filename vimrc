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
set guifont=Liberation\ Mono\ 10     " Liberation Mono size 9
set nopaste                         " Don't use ai when pasting
set guioptions-=T                   " Don't show the gvim toolbar
set relativenumber                  " Use relative numbers
set number                          " Use numbers too (hybrid line numbers)

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

" Buffer next/previous
nnoremap <C-N> :bnext<CR>
" nnoremap <C-P> :bprev<CR>              " C-P is owned by the search plugin

" When I hit F1 I usually mean to hit escape
map <F1> <Esc>
imap <F1> <Esc>

" Special settings:
au BufRead,BufNewFile *.c,*.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.conf,*.css,*.json,*.js,*.tpl,*.tmpl set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.html,*.rst,*.xml,*.xhtml,*.xsl set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.schema set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.py set sw=4 sts=4 ts=4
au BufRead,BufNewFile *.clj set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.yml set sw=2 sts=2 ts=2

"Associate .md with markdown not modula
au BufRead,BufNewFile *.md set filetype=markdown

" Syntax highlighting tweaks
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.js set ft=javascript

" Colors
colorscheme molokai
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

" Python
filetype plugin indent on

" https://github.com/guns/vim-clojure-static.git
let g:clojure_maxlines = 1000
let g:clojure_fuzzy_indent_patterns = "with.*,def.*,let.*,testing"

" Golang
let g:go_fmt_experimental = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,target,*/build/*
map <Leader>bb :CtrlPBuffer<CR>
map <Leader>f :CtrlP .<CR>
map <Leader>p :CtrlP<CR>

" syntastic
" sudo apt-get install python-pep8 python-pyflakes
let g:syntastic_python_checkers = ['pep8', 'pyflakes', 'python']
" we want to tell the syntastic module when to run
" we want to see code highlighting and checks when  we open a file
" but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" https://github.com/kien/rainbow_parentheses.vim.git
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
