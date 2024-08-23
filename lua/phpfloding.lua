vim.api.nvim_exec([[
  augroup DisableAutoFolding
    autocmd!
    autocmd FileType php setlocal foldlevel=99
  augroup END
]], false)
