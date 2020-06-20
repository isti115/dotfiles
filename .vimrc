source $VIMRUNTIME/defaults.vim

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set number
set foldmethod=marker

set noshelltemp

call plug#begin()
Plug 'pprovost/vim-ps1'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
call plug#end()
