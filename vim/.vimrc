" vim:set ts=2 sts=2 sw=2 expandtab:
call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use vim settings instead of vi
set nocompatible
set modelines=0 
" paste without auto-indentation
set paste
" hide buffers, not close them
set hidden
" remember more commands and search history
set history=10000
set tabstop=4

" use indents of 4 spaces
set shiftwidth=4

" let backspace delete indent
set softtabstop=4

" tabs are spaces
set expandtab

" enable autoindentation
set autoindent
set laststatus=2

" searching
set hlsearch
set incsearch

" highlight matching bracket/parenthesis
set showmatch

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase infercase

" show line numbers
set number

" no line wrapping
set nowrap

" highlight current line
set cursorline
set cursorcolumn
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
set shell=bash


" disable startup message
set shortmess+=I

" stop unnecessary redrawing
set lazyredraw


" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
set number

" Add spell checking
set spell

autocmd FileType python set

filetype on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
set term=screen-256color-bce
colorscheme default 
let g:solarized_termcolors=256
set guifont=Inconsolata:h18
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Map Ctrl-A to start of line
inoremap <c-a> <Home>
inoremap <c-e> <End>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

inoremap <C-space> <C-x><C-o>

set ofu=sytaxcomplete

autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"What this function does is that if there is no completion that could happen it will insert a tab. Otherwise it checks to see if there is an omnifunction available and, if so, uses it. Otherwise it falls back to Dictionary completion if there is a dictionary defined. Finally it resorts to simple known word completion. In general, hitting the Tab key will just do the right thing for you in any given situation.

function! SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\"
  else
    if &omnifunc != ''
      return "\\"
    elseif &dictionary != ''
      return "\"
    else
      return "\"
    endif
  endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
 
