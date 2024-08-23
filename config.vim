set encoding=UTF-8
set number
syntax on
" VimPlug plugin manager
call plug#begin('~/.local/share/nvim/site/plugged')
"call plug#begin()
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
"Plug 'https://github.com/neoclide/coc.nvim'
Plug 'pangloss/vim-javascript'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips' | Plug 'phux/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'universal-ctags/ctags'
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
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
"Plug 'dikiaap/minimalist'

Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'

"theme
Plug 'NLKNguyen/papercolor-theme'
"Plug 'fatih/molokai'

"golang
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'

" theme
Plug 'joshdick/onedark.vim'


Plug 'preservim/tagbar'


"php

Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'neovim/nvim-lspconfig'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}


" 收合
Plug 'rayburgemeestre/phpfolding.vim'
" AI
Plug 'github/copilot.vim'

call plug#end()
" set the colorsheme
" list: https://github.com/rafi/awesome-vim-colorschemes
" theme setting
" set background=dark
" 配置 Copilot 显示提案的延迟时间，默认是 100ms
"
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" 映射 <C-J> 为接受 Copilot 提案的快捷键
imap <C-J> <Plug>(copilot-accept)


"let g:rehash256 = 1
"let g:molokai_original = 1
" colorscheme minimalist
" colorscheme molokai
colorscheme onedark
set guioptions-=e

let g:coc_global_extensions = ['coc-phpls','coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" PHP7


augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END

" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"


" --------------------------------------------------------------------------------------------------------
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>


"runtime config/go.vim
runtime config/format.vim
runtime config/bar.vim
runtime config/normal.vim
runtime config/golang.vim
" runtime config/php.vim
"runtime config/setting.vim
hi Visual  guifg=White guibg=LightBlue gui=none
