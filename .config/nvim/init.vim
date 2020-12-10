" source $VIMRUNTIME/defaults.vim

" === Set values ===
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

  set colorcolumn=81

  set foldlevel=99

  set inccommand=nosplit

  set virtualedit=block

  set shell=/usr/bin/sh

  set nostartofline

  set mouse=a

  set splitbelow
  set splitright

colorscheme desert

" === Disabling arrow keys ===
  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Right> <Nop>

  inoremap <Up> <Nop>
  inoremap <Down> <Nop>
  inoremap <Left> <Nop>
  inoremap <Right> <Nop>

" === Custom commands ===
  command! MakeDir !mkdir -p %:h
  command! WlCopy w !wl-copy
  command! XCopy w !xclip -sel clip

" tnoremap <Esc> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>
" tnoremap jk <C-\><C-n>

" === Plugins ===
  call plug#begin()
  " Plug 'airblade/vim-gitgutter'
  " Plug 'https://github.com/cheery/idris-vim.git'
  " Plug 'https://github.com/joeytwiddle/vim-diff-traffic-lights-colors.git'
  " Plug 'terryma/vim-multiple-cursors'
  " Plug 'tomasr/molokai'
  Plug 'derekelkins/agda-vim'
  Plug 'edwinb/idris2-vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'joeytwiddle/vim-diff-traffic-lights-colors'
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'mattn/emmet-vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'mhinz/vim-startify'
  Plug 'pprovost/vim-ps1'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'tommcdo/vim-lion'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  call plug#end()

" === Plugin config ===
  let g:bclose_no_plugin_maps = 1
  let g:emmet_install_only_plug = 1
  let g:fzf_layout = { 'down': '15%' }
  let g:fzf_preview_window = []
  let g:ranger_map_keys = 0
  let g:which_key_disable_default_offset = 1


" === Colors ===
  highlight ColorColumn ctermbg=darkgray
  highlight WhichKeyFloating ctermbg=none
  highlight WhichKeySeperator ctermbg=none
  " hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
  " hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
  " runtime vim-diff-traffic-lights-colors.vim
  highlight Pmenu ctermbg=darkgray
  highlight PmenuSel ctermbg=lightgreen
  highlight PmenuSbar ctermbg=black
  highlight PmenuThumb ctermbg=white

" Fixing miserious space press:
" https://stackoverflow.com/questions/58330034/unexpected-space-character-while-in-explore-when-hitting-minus-key-in-neovi
nmap - <Plug>NetrwBrowseUpDir

nnoremap <silent> <Esc> :noh<Return>

map Y y$
imap kj <C-o>
imap jk <Esc>

" nmap asd :echo "asd"
" nnoremap qwe :echo "qwe"

nnoremap <Space>w <C-w>

" === Resizing ===
  nmap <Space>rh <C-w><<Space>r
  nmap <Space>rj <C-w>-<Space>r
  nmap <Space>rk <C-w>+<Space>r
  nmap <Space>rl <C-w>><Space>r
  nnoremap <Space>r<Esc> <Nop>

  " nmap <Plug>(ResizeMode)h <C-w><<Plug>(ResizeMode)
  " nmap <Plug>(ResizeMode)j <C-w>-<Plug>(ResizeMode)
  " nmap <Plug>(ResizeMode)k <C-w>+<Plug>(ResizeMode)
  " nmap <Plug>(ResizeMode)l <C-w>><Plug>(ResizeMode)

  " nmap <M-h>a :echo "a"
  " nmap <M-h>b :echo "b"
  " nnoremap <silent> <M-h> :WhichKey '<M-h>'
  " nmap <Plug>(ResizeMode)<Esc> <Nop>
  " nmap <Space>r <Plug>(ResizeMode)
  " nnoremap <silent> <Plug>(ResizeMode) :WhichKey '<Plug>(ResizeMode)'

  " nmap <Plug>(sajt) :echo "sajt"

  " nmap <Space>uio <Plug>(ResizeMode)

" === Files ===
  nnoremap <Space>fe :Explore<Return>
  nnoremap <Space>ff :Files<Return>
  nnoremap <Space>fh :History<Return>
  nnoremap <Space>fr :Ranger<Return>
  nnoremap <Space>fo :bro ol<Return>
  nnoremap <Space>fs :w<Return>
  nnoremap <Space>fS :save<Space>

" === Config ===
  nnoremap <Space>fca :edit ~/.config/alacritty/alacritty.yml<Return>
  nnoremap <Space>fci :edit ~/.config/i3/config<Return>
  nnoremap <Space>fcn :edit ~/.config/nvim/init.vim<Return>
  nnoremap <Space>fcp :edit ~/.config/powershell/Microsoft.PowerShell_profile.ps1<Return>
  nnoremap <Space>fcq :edit ~/programming/utility-scripts/quick-commands.sh<Return>
  nnoremap <Space>fcr :edit ~/.config/ranger/rc.conf<Return>
  nnoremap <Space>fcs :edit ~/.config/sway/config<Return>
  nnoremap <Space>fcv :edit $MYVIMRC<Return>

" nnoremap <Space>pc :PlugClean<Return>
" nnoremap <Space>pi :PlugInstall<Return>

" === Tabs ===
  nnoremap <Space>tn :tabnew<Return>
  nnoremap <Space>tl :tabnext<Return>
  nnoremap <Space>th :tabprevious<Return>
  nnoremap <Space>tL :+tabmove<Return>
  nnoremap <Space>tH :-tabmove<Return>
  nnoremap <Space>tc :tabclose<Return>

" === Buffers ===
  " nnoremap <Space>` <C-^>
  nnoremap <Space>` :b#<Return>
  nnoremap <Space>, :Buffers<Return>
  nnoremap <Space>bb :ls<Return>:b<Space>
  nnoremap <Space>bn :bn<Return>
  nnoremap <Space>bp :bp<Return>
  " nnoremap <Space>bl :ls<Return>
  nnoremap <Space>bl :buffers<Return>
  " nnoremap <Space>bd :bd<Return>
  " nnoremap <Space>bd :bn<bar>bd#<Return>
  nnoremap <Space>bd :Bclose<Return>

" === Clipboard ===
  nnoremap <Space>y "*y
  nnoremap <Space>p "*p
  nnoremap <Space>P "*p
  vnoremap <Space>y "*y
  vnoremap <Space>p "*p
  vnoremap <Space>Y :w !wl-copy<Return>

nnoremap <Space>ot :sp term://pwsh<Return>

" === Quit ===
  nnoremap <silent> <Space>qr :source $MYVIMRC <bar> echo "Configuration reloaded."<Return>
  nnoremap <Space>qq :q<Return>
  nnoremap <Space>qa :qa<Return>
  nnoremap <Space>qQ :q!<Return>

" === Change Shell ===
  nnoremap <Space>csb :set shell=/usr/bin/bash<Return>
  nnoremap <Space>csf :set shell=/usr/bin/fish<Return>
  nnoremap <Space>csp :set shell=/usr/bin/pwsh<Return>
  nnoremap <Space>css :set shell=/usr/bin/sh<Return>
  nnoremap <Space>csz :set shell=/usr/bin/zsh<Return>

nmap <Space>e <Plug>(emmet-expand-abbr)

" === FZF / Search ===
  nnoremap <Space>zb :BLines<Return>
  nnoremap <Space>z: :History:<Return>
  nnoremap <Space>zl :Lines<Return>
  nnoremap <Space>zm :Marks<Return>
  nnoremap <Space>z/ :History/<Return>
  nnoremap <Space>zz :Rg ""<Return>

" === Starify / Sessions ===
  nnoremap <Space>sh :Startify<Return>
  nnoremap <Space>ss :SSave<Return>
  nnoremap <Space>sS :SSave !<Return>
  nnoremap <Space>sl :SLoad<Return>
  nnoremap <Space>sc :SClose<Return>
  nnoremap <Space>sd :SDelete<Return>
  nnoremap <Space>sD :SDelete !<Return>

" === Git ===
  " nnoremap <Space>gg :Git<Return>
  nnoremap <Space>gg :vertical Git<Return>
  nnoremap <Space>gd :Gdiffsplit<Return>
  nnoremap <Space>gp :Git push<Return>

nnoremap <silent> <Space> :WhichKey '<Space>'<Return>
vnoremap <silent> <Space> :WhichKeyVisual '<Space>'<Return>

nnoremap <silent> <LocalLeader> :WhichKey '<LocalLeader>'<Return>

function AgdaSyntax()
  !agda --vim ./%
  so ./.%.vim
endfunction
nnoremap <silent> <Space>as :call AgdaSyntax()<Return>

au FocusGained,BufEnter * :checktime
au VimResized * wincmd =
" autocmd BufWritePre * %s/\s\+$//ce
autocmd! BufWritePre * execute "normal mm" | %s/\s\+$//ce | execute "normal `m"

" autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
