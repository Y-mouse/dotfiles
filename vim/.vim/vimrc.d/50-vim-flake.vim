" vim-flake8 customization


" Use F7 to call flake8
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>

let g:flake8_quickfix_location="topleft"

" To customize the height of quick fix window, set g:flake8_quickfix_height:
let g:flake8_quickfix_height=7

" To customize whether the show signs in the gutter, set g:flake8_show_in_gutter:
let g:flake8_show_in_gutter=1  " show

"To customize whether the show marks in the file, set g:flake8_show_in_file:
let g:flake8_show_in_file=1  " show

" To customize the number of marks to show, set g:flake8_max_markers:
let g:flake8_max_markers=10  " (default)

let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
let g:flake8_naming_marker=''      " disable naming warningsA

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg


