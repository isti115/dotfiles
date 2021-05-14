" autocmd FileType haskell,idris2 nnoremap <buffer> <silent> <Space>fs :w<bar>:e<bar><Return>
" autocmd FileType haskell,idris2 nnoremap <buffer> <silent> <Space>me :e<Return>
" imap jk <Esc>

autocmd FileType haskell,idris2 nnoremap <buffer> <silent> <Space>mr :w<bar>:call g:send_target.send([":r"])<Return>
autocmd FileType haskell nnoremap <buffer> <silent> <Space>ml :call g:send_target.send([':l '.expand('%:t')])<Return>
autocmd FileType haskell nnoremap <buffer> <silent> <Space>mL :call g:send_target.send([':l '.expand('%:p')])<Return>
autocmd FileType haskell nnoremap <buffer> <silent> <Space>mt "wyiw:call g:send_target.send([':t '.@w])<Return>
autocmd FileType haskell vnoremap <buffer> <silent> <Space>mt "wy:call g:send_target.send([':t '.@w])<Return>
autocmd FileType haskell nnoremap <buffer> <silent> <Space>mc :call g:send_target.send([':cd '.expand('%:p:h')])<Return>


" autocmd FileType haskell nnoremap <Space>Y <Cmd>%s/^--- //<Return><Cmd>%y+<Return>u<Cmd>noh<Return>
" autocmd FileType haskell nnoremap <Space>Y <Cmd>%s/{-MD\<Bar>MD-}//<Return><Cmd>%y+<Return>u<Cmd>noh<Return>
autocmd FileType haskell nnoremap <Space>Y <Cmd>g/{-md\<Bar>md-}/d<Return><Cmd>%y+<Return>u<Cmd>noh<Return>

" autocmd FileType haskell nnoremap <buffer> <silent> <LocalLeader>r :call g:send_target.send([':r'])<Return>
" autocmd FileType haskell nnoremap <buffer> <silent> <LocalLeader>l :call g:send_target.send([':l '.expand('%:p')])<Return>
" autocmd FileType haskell nnoremap <buffer> <silent> <LocalLeader>L :call g:send_target.send([':l '.expand('%:t')])<Return>
" autocmd FileType haskell nnoremap <buffer> <silent> <LocalLeader>t "wyiw:call g:send_target.send([':t '.@w])<Return>
" autocmd FileType haskell vnoremap <buffer> <silent> <LocalLeader>t "wy:call g:send_target.send([':t '.@w])<Return>
