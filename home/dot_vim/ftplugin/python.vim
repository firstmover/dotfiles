"""""""""
"  ale  "
"""""""""

" NOTE:: these setting works in ftplugin but not in global
" see https://github.com/dense-analysis/ale/issues/1878

" check Python files with flake8 and pylint.
let b:ale_linters = {
\   'python': ['mypy', 'flake8']
\}

" fix Python files with black and isort.
let b:ale_fixers = {
\   'python': ['black', 'isort']
\}

" do not fix on save 
let b:ale_fix_on_save=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-pydocstring                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" path to doq, doq installed locally
let g:pydocstring_doq_path = '$HOME/.local/bin/doq'

" use google format 
let g:pydocstring_formatter = 'google'

" insert single docstring to current buffer 
nnoremap <silent> <C--> :call pydocstring#insert()<CR>

" NOTE:: this will not work due to a bug in: 
" vim-pydocstring/ftplugin/python/pydocstring.vim
" nnoremap <silent> <C-_> <Plug>(pydocstring)<CR>

" insert docstring to all
nnoremap <silent> <C-_> :call pydocstring#format()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          vim-autoflake                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: this will not work due to a bug in: 
" vim-autoflake/ftplugin/python_autoflake.vim 
" nnoremap <C-=> :call Autoflake()<CR><CR>

nnoremap <silent> <buffer> <F9> :call Autoflake()<CR><CR>
" command! -bar Autoflake call Autoflake()

" remove all unused import (in addition to standard library)
let g:autoflake_remove_all_unused_imports=1

" do not remove unused variables
let g:autoflake_remove_unused_variables=0

" disable show diff
let g:autoflake_disable_show_diff=1
