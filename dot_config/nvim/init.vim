" === Options ===
  set autoread
  set colorcolumn=80
  set completeopt=menuone,noselect,noinsert
  set cursorline
  set expandtab
  set foldignore=
  set foldlevel=99
  set foldmethod=indent
  set hidden
  set ignorecase
  set inccommand=nosplit
  set noshelltemp
  set nostartofline
  set number
  set shiftwidth=2
  set smartcase
  set softtabstop=2
  set splitbelow
  set splitright
  set tabstop=2
  set termguicolors
  set timeoutlen=500
  set undofile
  set virtualedit=block

  let mapleader=" "

" === Buffers ===
  nmap <Leader>, <Cmd>buffers<CR>:buffer<Space>
  nmap <Leader>` <Cmd>buffer #<CR>
  nmap <Space>bn <Cmd>enew<CR>
  nmap <Space>bd <Cmd>bdelete<CR>

" === Clipboard ===
  nmap <Leader>y "+y
  nmap <Leader>Y <Cmd>%y+<CR>
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>y "+y
  vmap <Leader>p "+p

" === Files ===
  nmap <Leader>fs <Cmd>write<CR>
  nmap <Leader>fe <Cmd>Explore<CR>
  nmap <Leader>fo <Cmd>browse oldfiles<CR>
  nmap <Leader>fcn <Cmd>edit $MYVIMRC<CR>

" === Miscellaneous ===
  imap jk <C-c>
  nmap gh ^
  nmap gl $
  nmap <Esc> <Cmd>nohlsearch<CR>
  nmap <Leader>w <C-w>

" === Quit ===
  nmap <Leader>qr <Cmd>source $MYVIMRC<CR>
  nmap <Leader>qq <Cmd>quit<CR>
  nmap <Leader>qa <Cmd>quitall<CR>
  nmap <Leader>qQ <Cmd>quit!<CR>

" === Tabs ===
  nnoremap <Leader>tn <Cmd>tabnew<CR>
  nnoremap <Leader>tl <Cmd>tabnext<CR>
  nnoremap <Leader>th <Cmd>tabprevious<CR>
  nnoremap <Leader>tc <Cmd>tabclose<CR>

" === Terminal ===
  nmap <Leader>ot <Cmd>split term://$SHELL<CR>
  tmap <S-Esc> <C-\><C-n>
