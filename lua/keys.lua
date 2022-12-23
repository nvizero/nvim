--Vimspector 
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
--map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
--map('n', "Dw", ":call vimspector#AddWatch()<cr>")
--map('n', "De", ":call vimspector#Evaluate()<cr>")
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opt)
vim.keymap.set('n', '<C-s>', ':w!<CR>', opt)
vim.keymap.set('n', '<C-h>', '<C-w>h', opt)
vim.keymap.set('n', '<C-j>', '<C-w>j', opt)
vim.keymap.set('n', '<C-k>', '<C-w>k', opt)
vim.keymap.set('n', '<C-l>', '<C-w>l', opt)

vim.keymap.set('n', '<S-h>', '<Cmd>BufferPrevious<CR>' , opt)
vim.keymap.set('n', '<S-l>', '<Cmd>BufferNext<CR>' , opt)
vim.keymap.set('n', '<S-c>', '<Cmd>BufferClose<CR>' , opt)

vim.keymap.set('n', '<S-r>', ':GoRun<CR>' , opt)
vim.keymap.set('n', '<S-m>', '<C-w>>x5' , opt)
vim.keymap.set('n', '<S-n>', '<C-w><x5' , opt)
vim.keymap.set('n', '<S-n>', '<C-w><x5' , opt)
--vim.keymap.set('n', '<leader>f', ':FZF<CR>' , opt)


vim.keymap.set('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep()<cr>',opt )
vim.keymap.set('n', '<leader>ff', ':lua require(\'telescope.builtin\').find_files()<cr>',opt )
-------Lazy Git
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>',opt )

vim.cmd([[
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
]])
--
vim.keymap.set('i', '<S-l>', '<RIGHT>' , opt)
vim.keymap.set('i', '<S-h>', '<LEFT>' , opt)
vim.keymap.set('i', '<S-k>', '<UP>' , opt)
vim.keymap.set('i', '<S-j>', '<DOWN>' , opt)
--" previous and next buffer
