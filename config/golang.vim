let g:go_debug_windows = {
			\ 'vars':       'rightbelow 90vnew',
			\ 'stack':      'rightbelow 20new',
			\ }
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
