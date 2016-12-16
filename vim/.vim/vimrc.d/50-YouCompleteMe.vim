" YouCompleteMe https://github.com/Valloric/YouCompleteMe


let g:ycm_server_python_interpreter = '/usr/bin/python3'

let g:ycm_autoclose_preview_window_after_completion=1

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" force recompile
nnoremap <F5>  :YcmForceCompileAndDiagnostics<CR>

