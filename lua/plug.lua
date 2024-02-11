vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- other plugins...
    use 'simrat39/rust-tools.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use {
        'neovim/nvim-lspconfig',
        config = function()
            --require('lspconfig').gopls.setup{}
            diagnostic_config = {
                -- Enable underline, use default values
                underline = true,
                -- Enable virtual text, override spacing to 2
                virtual_text = {
                    spacing = 2,
                    prefix = '<',
                },
                -- Use a function to dynamically turn signs off
                -- and on, using buffer local variables
                signs = function(bufnr, client_id)
                    local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
                    -- No buffer local variable set, so just enable by default
                    if not ok then
                        return true
                    end

                    return result
                end,
                -- Disable a feature
                update_in_insert = false,
            }
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_config)
            --```
            -- 在 diagnostic 之間跳轉
            -- 映射 `[d` `]d` 跳轉到上一個和下一個 diagnostic
            -- ```plain text
            vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                { silent = true, noremap = true })
            vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                { silent = true, noremap = true })
            -- Read the following lspconfig section and add what you need
        end
    }
    -- other plugins...-- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-treesitter/nvim-treesitter'
    use 'puremourning/vimspector'
    use 'voldikss/vim-floaterm'
    use 'navarasu/onedark.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'romgrk/barbar.nvim',
        wants = 'nvim-web-devicons'
    }
    use {
        'fatih/vim-go',
        run = ':GoUpdateBinaries',
        ft = 'go',
        setup = function()
            -- Read the following section and add what you need
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local check_back_space = function()
                local col = vim.fn.col('.') - 1
                if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    return true
                else
                    return false
                end
            end

            _G.tab_complete = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-n>"
                elseif check_back_space() then
                    return t "<Tab>"
                else
                    return t "<C-x><C-o>"
                end
            end

            _G.s_tab_complete = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-p>"
                else
                    return t "<C-h>"
                end
            end

            _G.enter_key = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-y>"
                else
                    return t "<CR>"
                end
            end
            vim.api.nvim_set_keymap("i", "<tab>", "<C-R>=v:lua.tab_complete()<CR>", { silent = true, noremap = true })
            vim.api.nvim_set_keymap("i", "<s-tab>", "<C-R>=v:lua.s_tab_complete()<CR>", { silent = true, noremap = true })
            vim.api.nvim_set_keymap('i', '<enter>', '<C-R>=v:lua.enter_key()<CR>', { silent = true, noremap = true })
        end
    }
    --terminal
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    --use "lukas-reineke/indent-blankline.nvim"
    use "junegunn/fzf"
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kdheepak/lazygit.nvim'
    use "lukas-reineke/lsp-format.nvim"
    use { 'vim-scripts/progressbar-widget' }
    use { 'othree/html5.vim' }
    use { 'pangloss/vim-javascript' }
    use { 'evanleck/vim-svelte' }
    use { 'sheerun/vim-polyglot' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/neotest-go",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
            -- Your other test adapters here
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            require("neotest").setup({
                -- your neotest config here
                adapters = {
                    require("neotest-go"),
                },
            })
        end,
    })
end)
