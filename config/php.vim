
" php
" 設定自動補全

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()


" --------------------------------------------------------------------------------------------------------
" disable linting while typing
" --------------------------------------------------------------------------------------------------------
let g:ale_echo_cursor = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '===>> '  " 訊息前的前綴符號
let g:ale_virtualtext = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open=0
let g:ale_list_window_size = 3
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines'],
  \}
let g:ale_fix_on_save = 1
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_linters = {
\ 'php': ['phpcs', 'phpmd', 'phpstan'],
\}
" --------------------------------------------------------------------------------------------------------
"-- 配置 vim-gutentags
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_cache_dir = '~/.cache/tags'
" 至頂 目錄/function
" let g:gutentags_add_default_project_roots = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
