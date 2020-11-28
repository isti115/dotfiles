" source $VIMRUNTIME/defaults.vim

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set number
" set foldmethod=marker
set foldmethod=indent
set foldignore=

set noshelltemp

set hidden

set autochdir
set ignorecase
set smartcase

set timeoutlen=500

set autoread
set undofile

colorscheme desert

command! MakeDir !mkdir -p %:h
command! WlCopy w !wl-copy

" tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

call plug#begin()
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-lion'
Plug 'pprovost/vim-ps1'
Plug 'derekelkins/agda-vim'
Plug 'liuchengxu/vim-which-key'
Plug 'edwinb/idris2-vim'
Plug 'joeytwiddle/vim-diff-traffic-lights-colors'
" Plug 'https://github.com/joeytwiddle/vim-diff-traffic-lights-colors.git'
" Plug 'https://github.com/cheery/idris-vim.git'
" Plug 'tomasr/molokai'
call plug#end()

highlight WhichKeyFloating ctermbg=none
" hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
" hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
" runtime vim-diff-traffic-lights-colors.vim

nmap - <Plug>NetrwBrowseUpDir
nnoremap <Esc> :noh<Enter>

map Y y$
imap jk <Esc>

nnoremap <Space>w <C-w>
" nnoremap <Space>wk <C-w>k
" nnoremap <Space>wj <C-w>j
" nnoremap <Space>wh <C-w>h
" nnoremap <Space>wl <C-w>l
" nnoremap <Space>wq :wq

nnoremap <Space>ff :Explore<Enter>
nnoremap <Space>fr :bro ol<Enter>
nnoremap <Space>fs :w<Enter>

nnoremap <Space>fcv :edit $MYVIMRC<Enter>
nnoremap <Space>fcn :edit ~/.config/nvim/init.vim<Enter>
nnoremap <Space>fcs :edit ~/.config/sway/config<Enter>
nnoremap <Space>fci :edit ~/.config/i3/config<Enter>
nnoremap <Space>fcp :edit ~/.config/powershell/Microsoft.PowerShell_profile.ps1<Enter>
nnoremap <Space>fcq :edit ~/programming/utility-scripts/quick-commands.sh<Enter>

nnoremap <Space>pc :PlugClean<Enter>
nnoremap <Space>pi :PlugInstall<Enter>

" nnoremap <Space>` <C-^>
nnoremap <Space>` :b#<Enter>
nnoremap <Space>' :ls<Enter>:b<Space>
nnoremap <Space>bn :bn<Enter>
nnoremap <Space>bp :bp<Enter>
" nnoremap <Space>bl :ls<Enter>
nnoremap <Space>bl :buffers<Enter>

nnoremap <Space>y "*y
nnoremap <Space>p "*p
vnoremap <Space>y "*y
vnoremap <Space>p "*p
vnoremap <Space>Y :w !wl-copy<Enter>

nnoremap <Space>ot :sp term://pwsh<Enter>

nnoremap <Space>qr :source $MYVIMRC<Enter>
nnoremap <Space>qq :q<Enter>
nnoremap <Space>qa :qa<Enter>
nnoremap <Space>qQ :q!<Enter>

nnoremap <Space>ssb :set shell=/usr/bin/bash<Enter>
nnoremap <Space>ssp :set shell=/usr/bin/pwsh<Enter>

let g:which_key_disable_default_offset = 1

nnoremap <silent> <Space> :WhichKey '<Space>'<Enter>
vnoremap <silent> <Space> :WhichKeyVisual '<Space>'<Enter>

nnoremap <silent> <LocalLeader> :WhichKey '<LocalLeader>'<Enter>

function AgdaSyntax()
  !agda --vim ./%
  so ./.%.vim
endfunction

nnoremap <silent> <Space>as :call AgdaSyntax()<Enter>
au FocusGained,BufEnter * :checktime
autocmd BufWritePre * %s/\s\+$//ce
