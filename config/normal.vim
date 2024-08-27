set termguicolors

" tabtar
hi TabLine guifg=#fadfc2 guibg=#7d8e7b gui=underline
hi TabLineSel guifg=#ffffff guibg=#6c698a gui=bold,italic
hi TabLineFill guifg=#2dbd1e guibg=#ffffff

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
