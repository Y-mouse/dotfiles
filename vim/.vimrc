" vim: set ts = 2 sts = 2 sw = 2 expandtab:

runtime! bundle/vim-pathogen/vimrc.d/config.vim
runtime! bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

runtime! vimrc.d/[[:digit:]][[:digit:]]*.vim
runtime! bundle/*/vimrc.d/*.vim

Helptags
