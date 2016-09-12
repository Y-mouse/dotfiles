" vim:set ts=2 sts=2 sw=2 expandtab:
call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use word-wrap
set wrap

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

" wildignore
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

"show hidden files in ctrl_p
let g:ctrlp_show_hidden = 1 

" press esc to remove the highlight
nnoremap <CR> :noh<CR><CR>
" press F3 to toggle the highlight
nnoremap <F3> :set hlsearch!<CR>

" disable startup message
set shortmess+=I

" stop unnecessary redrawing
set lazyredraw


" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" set json syntax hlight
autocmd BufNewFile,BufRead *.json set ft=javascript

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

" autocmd FileType python set

filetype on
filetype plugin indent on

" CtrlP configuration
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=light
set term=screen-256color-bce
"enable 256 colors to solarized. Must be before the colorscheme commmand
let g:solarized_termcolors=256
colorscheme solarized
" turn high visibility for diffmore
let g:solarized_diffmode="high"

set guifont=Inconsolata:h18
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" open new split panes to right and bottom
set splitbelow
set splitright


" Map Ctrl-A to start of line
inoremap <c-a> <Home>
inoremap <c-e> <End>

" add fugitive status line
set statusline="%{fugitive#statusline()}"


" add syntastic statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_List = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" use python 
let g:syntastic_python_checkers = ['pylint']

" use pylintrc
let g:syntastic_python_pylint_args = "--rcfile=/home/fmilo/.pylintrc"

" set vertical split in fugitive gDiff
set diffopt+=vertical

" set the name of the tag files to search
set tags=.git/tags;./tags;$HOME,tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Force markdown format in buffer
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" enable feced code highligth in markdown block
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']


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

" Disable one diff window during a three-way diff allowing you to cut out the
" noise of a three-way diff and focus on just the changes between two versions
" at a time. Inspired by Steve Losh's Splice
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind) and move
  " the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>
