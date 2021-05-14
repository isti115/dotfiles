autocmd BufEnter *.org vmap <buffer> <Space>ml c⌜∣⟦"⟧∣⌝
autocmd BufEnter *.org vmap <buffer> <Space>mp c≡⟨"⟩
autocmd BufEnter *.org nmap <buffer> <Space>ma glip/≡<Return>

autocmd FileType org syntax match Qualifier "[ₘₐₜⱼ]" conceal
autocmd FileType org highlight Qualifier guifg=lightgray

autocmd FileType org syntax match Operator "[,∘▹]\|⁻¹" " ∙ε
autocmd FileType org highlight Operator guifg=yellow

autocmd FileType org syntax match Lift "\(⌜∣⟦\)\|\(⟧∣⌝\)"
autocmd FileType org highlight Lift guifg=lightcyan3

autocmd FileType org syntax match Proof "[≡⟨⟩]"
autocmd FileType org highlight Proof guifg=orange

autocmd FileType org syntax match Check "CHECK"
autocmd FileType org highlight Check guibg=green

autocmd FileType org syntax match Todo "TODO"
autocmd FileType org highlight Todo guibg=red

autocmd FileType org RainbowParenthesesLoadRound
autocmd FileType org RainbowParenthesesLoadSquare
autocmd FileType org RainbowParenthesesLoadBraces
autocmd FileType org RainbowParenthesesActivate

autocmd FileType org set matchpairs+=⌜:⌝
autocmd FileType org set matchpairs+=⟦:⟧
