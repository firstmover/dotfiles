" 2 space as a tab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"""""""""
"  ale  "
"""""""""

" Fix files with prettier, and then tslint
" Installing tslint is very tricky
let b:ale_fixers = ['prettier']

" Equivalent to the above.
let b:ale_fixers = {'typescript': ['prettier']}

" do not fix on save
let b:ale_fix_on_save=0
