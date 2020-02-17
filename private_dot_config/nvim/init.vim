
" source vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc/basic.vim
source ~/.vim/vimrc/plugin.vim

" python3 path 
let g:python3_host_prog='/usr/local/bin/python3'

