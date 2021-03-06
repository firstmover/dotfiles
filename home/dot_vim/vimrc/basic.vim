""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  general                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <Leader> 
let mapleader=" "

" close / write  
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

" no annoying sound on error 
set noerrorbells
set novisualbell
set t_vb=
set tm=500 

" set utf8 as encoding 
set encoding=utf8

" has async 
let g:has_async = v:version >= 800 || has('nvim') 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  filetype                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable file type plugin
filetype plugin on

augroup vimrc_filetype
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile .alias,.env,.function,.bindkey set filetype=sh
  autocmd BufRead,BufNewFile .tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile .ts,.tsx set filetype=typescript
  autocmd BufRead,BufNewFile .js,.jsx set filetype=javascript

augroup END
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  editing                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map kk to esc in insert mode 
inoremap kk <esc>
inoremap Kk <esc>
inoremap kK <esc>
inoremap KK <esc>
inoremap jj <esc>
" inoremap ww <esc>
" inoremap <esc> <nop> 

" move to beginning/end of line
noremap , ^
noremap . $
" nnoremap $ <nop>
" nnoremap ^ <nop>

" auto read when file is changed from outside 
" set autoread 
" au FocusGained, BufEnter * checktime 

" turn off backup
set nobackup
set nowb 
set noswapfile

" file type dependent indent 
filetype indent on

" expand tab to space 
set expandtab

" 4 space as a tab 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" clean trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" toggle paste mode on and off 
map <leader>pp :setlocal paste!<cr>

" swap _ - 
" inoremap _ -
" inoremap - _

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 navigation                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable mouse 
set mouse=a

" wrap <,>,h,l to move to next or previous line 
" set whichwrap+=<,>,h,l

" 16 line to cursor 
set scrolloff=16

" do incremental searching 
set incsearch 

" ignore case when searching 
set ignorecase 

" be smart about case when searching 
set smartcase 

" TODO:  <18-01-20, YL> "
" navigation between tabs, windows and buffers 
" see amix/vimrc basic.vim for more 

" TODO:  <18-01-20, YL> "
" map Home End and C-U 
" parenthesis and bracket 
" see amix/vimrc extended.vim for more 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              color and layout                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight search results 
set hlsearch

" highlight current line / column 
set cursorline
set cursorcolumn

" enable syntax highlight 
syntax on

" show status line 
set laststatus=2

" show line number 
" set number
set relativenumber
set nu rnu

" disable line wrapping 
set nowrap

" folding based on indent or syntax 
"set foldmethod=indent
set foldmethod=syntax

" disable folding at opening 
set nofoldenable

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" customized color scheme 
colorscheme molokai_dark

