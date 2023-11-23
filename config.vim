set encoding=UTF-8
set number
syntax on
" VimPlug plugin manager
call plug#begin('~/.local/share/nvim/site/plugged')
"call plug#begin()
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'

"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc extensions
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
"Plug 'ianks/vim-tsx'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
"Plug 'leafgarland/typescript-vim'
"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D

Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'

"theme
"Plug 'dikiaap/minimalist'
"Plug 'fatih/molokai'


"old
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'pangloss/vim-javascript'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Chiel92/vim-autoformat'

"php
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'stephpy/vim-php-cs-fixer'         " Coding standards fixer
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'} " PHP introspection and refactor tools
Plug 'phpactor/ncm2-phpactor'           " Phpactor integration for ncm2 (autocomplete)
Plug 'tobyS/pdv'                        " Auto generating php docblocks
Plug 'ludovicchabant/vim-gutentags'     " Automatic ctags
Plug 'SirVer/ultisnips'                 " Snippets. Also a dependency of pdv (the way we have it configured)
Plug 'phux/vim-snippets'               " Large snippets library for multiple languages
Plug 'tobyS/vmustache'                  " Templating system (required for pdv)
Plug 'vim-airline/vim-airline'          " Vim status line
Plug 'vim-airline/vim-airline-themes'   " Vim status line themes
Plug 'ncm2/ncm2'                        " Autocompletion engine
Plug 'ncm2/ncm2-bufword'                " Basic word completion? testing
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'                  " Yet Another Remote Plugin Framework (dependency of ncm2)
Plug 'morhetz/gruvbox'                  " Vim colorscheme
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search and more
Plug 'tpope/vim-fugitive'               " Git integration
Plug 'mhinz/vim-signify'                " Git integration inline
Plug 'janko-m/vim-test'                 " Run unit tests
Plug 'tpope/vim-dispatch'               " Dispatch tasks (only using it for unit tests)
Plug 'w0rp/ale'                         " Asynchronous code linter and anylysis
Plug 'scrooloose/nerdtree'              " File/directory Tree explorer

call plug#end()

" set the colorsheme
" list: https://github.com/rafi/awesome-vim-colorschemes
"colorscheme molokai
colorscheme minimalist

let g:rehash256 = 1
let g:molokai_original = 1
set guioptions-=e

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

let g:UltiSnipsExpandTrigger="<c-w>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"runtime config/go.vim
runtime config/format.vim
runtime config/php.vim
runtime config/normal.vim
runtime config/golang.vim
runtime config/setting.vim
hi Visual  guifg=White guibg=LightBlue gui=none
