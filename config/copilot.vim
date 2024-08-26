
" ai 
let g:copilot_no_tab_map = v:true

" 使用 <C-J> 接受 Copilot 的建議
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" 使用 <C-K> 觸發 Copilot 的建議
imap <silent><script><expr> <C-K> copilot#Suggest()

" 使用 <C-L> 取消 Copilot 的建議
imap <silent><script><expr> <C-L> copilot#Dismiss()

