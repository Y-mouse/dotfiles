
call pathogen#infect()



set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax on
set ofu=sytaxcomplete

autocmd FileType python set

filetype on
filetype plugin indent on

set t_Co=256
set background=dark
set term=xterm-256color
colorscheme zenburn
let g:zenburn_force_dark_Background=1
set guifont=Inconsolata:h18

set foldmethod=indent
set foldlevel=99

autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

autocmd BufNewFile,BufRead *.py compiler nose 
