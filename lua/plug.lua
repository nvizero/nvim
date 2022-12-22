vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- other plugins...

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'neovim/nvim-lspconfig'
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

		    vim.api.nvim_set_keymap("i", "<tab>", "<C-R>=v:lua.tab_complete()<CR>" ,{silent = true, noremap = true})
		    vim.api.nvim_set_keymap("i", "<s-tab>", "<C-R>=v:lua.s_tab_complete()<CR>" ,{silent = true, noremap = true})
		    vim.api.nvim_set_keymap('i', '<enter>', '<C-R>=v:lua.enter_key()<CR>' ,{silent = true, noremap = true})

	    end
    }

    use {"lukas-reineke/indent-blankline.nvim" }
    use {"junegunn/fzf"}
    use {'nvim-telescope/telescope.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'kdheepak/lazygit.nvim'}
end)
