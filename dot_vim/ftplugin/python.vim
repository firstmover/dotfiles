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

