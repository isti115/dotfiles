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
  set linebreak

  set foldlevel=99

  set inccommand=nosplit

  set virtualedit=block

  set shell=/usr/bin/sh

  set nostartofline

  set mouse=a

  set splitbelow
  set splitright

  " set completeopt+=longest
  set completeopt=menuone,noselect,noinsert

  set termguicolors
  " set signcolumn=number
  set cursorline

" === Disabling arrow keys ===
  " noremap <Up> <Nop>
  " noremap <Down> <Nop>
  " noremap <Left> <Nop>
  " noremap <Right> <Nop>

  " inoremap <Up> <Nop>
  " inoremap <Down> <Nop>
  " inoremap <Left> <Nop>
  " inoremap <Right> <Nop>

  " inoremap <Esc> <Nop>

" === Custom commands ===
  command! MakeDir !mkdir -p %:h
  command! WlCopy w !wl-copy
  command! XCopy w !xclip -sel clip

" === Plugins ===
  call plug#begin()
  " Plug 'airblade/vim-rooter'
  " Plug 'cheery/idris-vim'
  " Plug 'jceb/vim-orgmode'
  " Plug 'luochen1990/rainbow'
  " Plug 'mkotha/conflict3'
  " Plug 'morhetz/gruvbox'
  " Plug 'terryma/vim-multiple-cursors'
  " Plug 'tpope/vim-commentary'
  " Plug 'zacanger/angr.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/writable_search.vim'
  " Plug 'aserebryakov/vim-todo-lists'
  Plug 'axvr/org.vim'
  Plug 'derekelkins/agda-vim'
  Plug 'edwinb/idris2-vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'freitass/todo.txt-vim'
  " Plug 'folke/tokyonight.nvim'
  Plug 'joeytwiddle/vim-diff-traffic-lights-colors'
  Plug 'junegunn/fzf.vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'mattn/emmet-vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'mhinz/vim-startify'
  Plug 'mtikekar/nvim-send-to-term'
  Plug 'neovim/nvim-lspconfig'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'posva/vim-vue'
  Plug 'pprovost/vim-ps1'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'tomasr/molokai'
  Plug 'tommcdo/vim-lion'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-characterize'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  call plug#end()

  " nnoremap <Space>pc :PlugClean<Return>
  " nnoremap <Space>pi :PlugInstall<Return>

" === Plugin config ===
  " call add(g:rooter_patterns, '.project')
  " let g:rooter_patterns += [ '.project' ]
  let g:bclose_no_plugin_maps = 1
  let g:completion_enable_auto_popup = 0
  let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
  let g:emmet_install_only_plug = 1
  let g:fzf_layout = { 'down': '15%' }
  let g:fzf_preview_window = []
  let g:ranger_map_keys = 0
  let g:rooter_patterns = [ '.project', '.git' ]
  let g:which_key_disable_default_offset = 1
  let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['red',         'firebrick3'],
      \ ]
" === Colors ===
  " colorscheme desert
  colorscheme molokai
  highlight Normal guibg=NONE
  highlight clear LineNr
  " highlight LineNr guibg=NONE
  highlight clear SignColumn
  " highlight SignColumn guibg=NONE

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

  highlight javaScriptNumber guifg=orange

  highlight idrisMetaVar ctermfg=DarkRed
  highlight idrisDelimiter ctermfg=208

  hi MatchParen cterm=none ctermbg=124 ctermfg=253 guifg=orange guibg=black

" Fixing miserious space press:
" https://stackoverflow.com/questions/58330034/unexpected-space-character-while-in-explore-when-hitting-minus-key-in-neovi
nmap - <Plug>NetrwBrowseUpDir


" === Miscellaneous mappings ===

nnoremap <silent> <Esc> :noh<Return>

" tnoremap <Esc> <C-\><C-n>
tnoremap <Space>w <C-\><C-n><C-w>
tnoremap <Esc><Esc> <C-\><C-n>
" tnoremap <Del><BS> <C-\><C-n>
" tnoremap <BS><Del> <C-\><C-n>
" tnoremap jk <C-\><C-n>

map Y y$
imap kj <C-o>
imap jk <Esc>
" imap jk <C-c>
imap kjk k<Esc>
" imap kjk k<C-c>
" vmap jk <C-c>

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
  nnoremap <Space><Space> :GFiles<Return>
  nnoremap <Space>ff :Rooter<Return>:Files<Return>
  nnoremap <Space>fh :History<Return>
  nnoremap <Space>fr :Ranger<Return>
  nnoremap <Space>fo :bro ol<Return>
  nnoremap <Space>fs :w<Return>
  nnoremap <Space>fC :save<Space>
  function SaveAs()
    call inputsave()
    let name = input('name: ')
    if !empty(name)
        execute 'save' name
        execute 'edit' name
    end
    call inputrestore()
  endfunction
  nnoremap <Space>fS :call SaveAs()<Return>
  function NewFile()
    call inputsave()
    let name = input('name: ')
    if !empty(name)
        execute 'edit' name
        write
    end
    call inputrestore()
  endfunction
  nnoremap <Space>fn :call NewFile()<Return>

" === Config ===
  nnoremap <Space>fca :edit ~/.config/alacritty/alacritty.yml<Return>
  nnoremap <Space>fci :edit ~/.config/i3/config<Return>
  nnoremap <Space>fcn :edit ~/.config/nvim/init.vim<Return>
  nnoremap <Space>fcp :edit ~/.config/powershell/Microsoft.PowerShell_profile.ps1<Return>
  nnoremap <Space>fcqb :edit ~/.config/qutebrowser/config.py<Return>
  nnoremap <Space>fcqc :edit ~/programming/utility-scripts/quick-commands.sh<Return>
  nnoremap <Space>fcr :edit ~/.config/ranger/rc.conf<Return>
  nnoremap <Space>fcs :edit ~/.config/sway/config<Return>
  nnoremap <Space>fcv :edit $MYVIMRC<Return>

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
  nnoremap <Space>bn :new<Return>
  nnoremap <Space>bj :bn<Return>
  nnoremap <Space>bk :bp<Return>
  " nnoremap <Space>bl :ls<Return>
  nnoremap <Space>bl :buffers<Return>
  " nnoremap <Space>bd :bd<Return>
  " nnoremap <Space>bd :bn<bar>bd#<Return>
  nnoremap <silent> <Space>bd :Bclose<Return>
  nnoremap <silent> <Space>bD :Bclose!<Return>

" === Clipboard === (* vs + ???)
  nnoremap <Space>y "+y
  nnoremap <Space>Y :%y+<Return>
  nnoremap <Space>p "+p
  nnoremap <Space>P "+P
  vnoremap <Space>y "+y
  vnoremap <Space>p "+p
  vnoremap <Space>Y :w !wl-copy<Return>

  nnoremap <A-p> "0p
  vnoremap <A-p> "0p

" === Quit ===
  nnoremap <silent> <Space>qr :source $MYVIMRC <bar> echo "Configuration reloaded."<Return>
  nnoremap <Space>qq :q<Return>
  nnoremap <Space>qa :qa<Return>
  nnoremap <Space>qQ :q!<Return>
  nnoremap <Space>QQ :q!<Return>

" === Change Shell ===
  nnoremap <Space>csb :set shell=/usr/bin/bash<Return>
  nnoremap <Space>csf :set shell=/usr/bin/fish<Return>
  nnoremap <Space>csp :set shell=/usr/bin/pwsh<Return>
  nnoremap <Space>css :set shell=/usr/bin/sh<Return>
  nnoremap <Space>csz :set shell=/usr/bin/zsh<Return>

nmap <Space>e <Plug>(emmet-expand-abbr)
nnoremap <Space>ot :sp term://pwsh<Return>
nnoremap <Space>og :vsp term://ghci<Return>
nnoremap <Space>ow :set tw=80<Return>

" === FZF / Search ===
  nnoremap <Space>zb :BLines<Return>
  nnoremap <Space>z: :History:<Return>
  nnoremap <Space>zl :Lines<Return>
  nnoremap <Space>zm :Marks<Return>
  nnoremap <Space>z/ :History/<Return>
  nnoremap <Space>zz :Rg ""<Return>

" === Completion ===
  nmap <Space>xf <plug>(fzf-complete-path)

" === Starify / Sessions ===
  nnoremap <Space>sh :Startify<Return>
  nnoremap <Space>ss :SSave<Return>
  nnoremap <Space>sS :SSave!<Return>
  nnoremap <Space>sl :SLoad<Return>
  nnoremap <Space>sc :SClose<Return>
  nnoremap <Space>sd :SDelete<Return>
  nnoremap <Space>sD :SDelete!<Return>

" === Git ===
  " nnoremap <Space>gg :Git<Return>
  nnoremap <Space>gg :vertical Git<Return>
  nnoremap <Space>gd :Gdiffsplit<Return>
  nnoremap <Space>gp :Git push<Return>
  nnoremap <Space>gf :Git push --force-with-lease<Return>
  nnoremap <Space>gP :Git pull<Return>

" === Help / Describe ===
  map <Space>hh
    \ :echo
    \ 'hi<'    . synIDattr(synID(line("."),col("."),1),"name") . '> ' .
    \ 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> ' .
    \ 'lo<'    . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'
    \ <Return>

nnoremap <silent> <Space> :WhichKey '<Space>'<Return>
vnoremap <silent> <Space> :WhichKeyVisual '<Space>'<Return>

imap <C-Space> <C-o><Space>

nnoremap <silent> <LocalLeader> :WhichKey '<LocalLeader>'<Return>

function AgdaSyntax()
  !agda --vim ./%
  so ./.%.vim
endfunction
nnoremap <silent> <Space>as :call AgdaSyntax()<Return>

au FocusGained,BufEnter * :checktime
" au VimResized * wincmd =
" autocmd BufWritePre * %s/\s\+$//ce
autocmd! BufWritePre *
  \ execute "normal mm" |
  \ %s/\s\+$//ce |
  \ %s/\_s\+\%$//ce |
  \ execute "normal `m"

autocmd! BufNewFile *.sh 0put =\"#!/usr/bin/env sh\<nl>\<nl>\"|$

" autocmd! TermOpen term://*pwsh tnoremap jk <C-\><C-n>
autocmd! TermOpen term://*ghci silent! :SendHere<Return>

" autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" temporary bindings:
" let @q="mmgg/code startV/code endy/result startjV/result endkpgv!node`m"


" === Language Server ===

lua << LUA
  require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
  require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
  require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
  require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
LUA

imap <Tab> <Plug>(completion_smart_tab)
nmap <silent> <Space>hf :!eslint --fix %<Return>

nmap <Space>lh :lua vim.lsp.buf.hover()<Return>
nmap <Space>ls :lua vim.lsp.buf.signature_help()<Return>
nmap <Space>lg :lua vim.lsp.buf.definition()<Return>
nmap <Space>ld :lua vim.lsp.diagnostic.show_line_diagnostics()<Return>
nmap <Space>lp :lua vim.lsp.diagnostic.goto_prev()<Return>
nmap <Space>ln :lua vim.lsp.diagnostic.goto_next()<Return>
nmap <Space>la :lua vim.lsp.buf.code_action()<Return>
" nmap <Space>lr :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<Return><bar>:edit<Return>


nnoremap <silent> <Space>HL :exe "let m= matchadd('WildMenu','\\%" . line('.') . "l')"<CR>
nnoremap <silent> <Space>HW :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . line(".") . "l\\%" . col(".") . "c\\w*\\>')"<CR>
nnoremap <silent> <Space>HC :call clearmatches()<CR>

runtime haskell.vim
runtime digraphs.vim
runtime org.vim
