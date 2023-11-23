-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
--vim.opt.neotree_show_hidden_files = 1
vim.g.neotree_show_hidden_files = 1
vim.g.loaded_netrwPlugin = 1
-- empty setup using defaults
--require("nvim-tree").setup()
-- OR setup with some options
require("nvim-tree").setup({
  git = {
    enable = false
  },
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
