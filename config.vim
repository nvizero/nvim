set encoding=UTF-8
set number
syntax on
" VimPlug plugin manager
call plug#begin('~/.local/share/nvim/site/plugged')
"call plug#begin()
"Plug 'https://github.com/ap/vim-css-color'
"Plug 'https://github.com/rafi/awesome-vim-colorschemes'

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
"Plug 'dikiaap/minimalist'

Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'

"theme
Plug 'fatih/molokai'


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
"Plug 'honza/vim-snippets'               " Large snippets library for multiple languages
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
"Plug 'bling/vim-bufferline'             " Show buffers in status bar
Plug 'w0rp/ale'                         " Asynchronous code linter and anylysis
Plug 'scrooloose/nerdtree'              " File/directory Tree explorer

call plug#end()

" set the colorsheme
" list: https://github.com/rafi/awesome-vim-colorschemes
" colorscheme minimalist

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
set guioptions-=e

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

let g:UltiSnipsExpandTrigger="<c-w>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" PHP7
let g:ultisnips_php_scalar_types = 1

autocmd FileType php setlocal omnifunc=phpcd#CompletePHP


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

" disable linting while typing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \}
let g:ale_fix_on_save = 1


command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>


let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"

let g:vim_php_refactoring_use_default_mapping = 0
nnoremap <leader>rlv :call PhpRenameLocalVariable()<CR>
nnoremap <leader>rcv :call PhpRenameClassVariable()<CR>
nnoremap <leader>rrm :call PhpRenameMethod()<CR>
nnoremap <leader>reu :call PhpExtractUse()<CR>
vnoremap <leader>rec :call PhpExtractConst()<CR>
nnoremap <leader>rep :call PhpExtractClassProperty()<CR>
nnoremap <leader>rnp :call PhpCreateProperty()<CR>
nnoremap <leader>rdu :call PhpDetectUnusedUseStatements()<CR>
nnoremap <leader>rsg :call PhpCreateSettersAndGetters()<CR>

" context-aware menu with all functions (ALT-m)
nnoremap <m-m> :call phpactor#ContextMenu()<cr>

nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>
"runtime config/go.vim
runtime config/format.vim
runtime config/normal.vim
runtime config/golang.vim
"runtime config/setting.vim
hi Visual  guifg=White guibg=LightBlue gui=none
