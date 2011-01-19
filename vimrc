set ai                              " Autoindent what I've indented myself
set expandtab                       " Replace tabs with the of spaces
set hidden
set incsearch                       " Do incremental searching
set listchars=trail:.,tab:>-,eol:$  " What characters to show with F2
set nocompatible                    " Use vim defaults
set shiftwidth=4                    " Number of spaces per (auto) indent
""" set smartindent                     " Smart indent
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
set tabpagemax=20                   " Allow up to 20 files to be open in tabs
set showtabline=2                   " Always show tabs at the top

map <silent> <F2> :set invlist<CR>		" Show/hide hidden Chars
map <silent> <F3> :set invhlsearch<CR>	" Show/hide found pattern
map <silent> <F5> :source ~/.vimrc<CR>	" Reload .vimrc
map <silent> <F8> gwap                  " Format paragraph
map <C-Tab> :tabn<CR>
map <S-C-Tab> :tabp<CR>

" Special settings:
au BufRead,BufNewFile *.c,*.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.conf,*.css,*.js,*.tmpl set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.rst,*.xml,*.xhtml,*.xsl set sw=2 sts=2 ts=2
au BufRead,BufNewFile *.py set sw=4 sts=4 ts=4

" Syntax highlighting tweaks
autocmd BufNewFile,BufRead *.json set ft=javascript

" Colors
colorscheme evening
syntax on

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
autocmd BufWritePre * :call StripTrailingWhitespace()
