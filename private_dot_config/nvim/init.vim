
" source vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc/basic.vim
source ~/.vim/vimrc/plugin.vim

" python3 path 
" TODO:  <04-02-20, YL> "
" a virtual env for vim python 
let g:python3_host_prog='$HOME/anaconda3/bin/python3'

