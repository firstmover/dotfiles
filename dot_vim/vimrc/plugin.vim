""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-plug                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use junegunn/vim-plug to manage all vim plugins 

" install vim-plug if not exists
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin list 
call plug#begin('~/.vim/plugged')

"""""""""""""
"  editing  "
"""""""""""""

" text completion 
" TODO:  <19-01-20, YL> "
" clang flag??
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py' }
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" template 
Plug 'aperezdc/vim-template'

" comment 
Plug 'scrooloose/nerdcommenter'

" paired brackets, parens and quotes 
Plug 'jiangmiao/auto-pairs'

" syntax check 
if g:has_async
  Plug 'dense-analysis/ale'
endif 

" quick select 
Plug 'gcmt/wildfire.vim'

""""""""""""
"  layout  "
""""""""""""

" file list 
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" statusline and statusline theme  
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""""""""""""""""
"  navigation  "
""""""""""""""""

" navigation across text 
Plug 'Lokaltog/vim-easymotion'

" file finder 
" TODO:  <28-01-20, YL> "
" install should be handled seperately
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

""""""""""
"  misc  "
""""""""""

" git 
Plug 'airblade/vim-gitgutter'

call plug#end() 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               YouCompleteMe                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <19-01-20, YL> "
" read youcompleteme new features 

" jump to declaration 
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>

" menu color 
highlight Pmenu ctermfg=063 ctermbg=235 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=063 ctermbg=235 guifg=#AFD700 guibg=#106900

" use completion in comment 
let g:ycm_complete_in_comments=1

" allow loading ycm_extra_conf file 
let g:ycm_confirm_extra_conf=1

" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview

" start completion from second char 
let g:ycm_min_num_of_chars_for_completion=2

" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0

" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax=1

" Use global ycm_extra_conf.py 
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf_python.py'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          vim-snippets, ultisnips                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal_snippets"]
let g:UltiSnipsExpandTrigger="<c-f>"
"let g:UltiSnipsJumpForwardTrigger="<c-n>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>" 

let g:ultisnips_python_style="google"
let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_triple_quoting_style="double"

let g:snips_author="YL"  " author name tag in codes 
let g:snips_email="liuyc@mit.edu"
let g:snips_github="https://github.com/firstmover"

"let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-template                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:templates_directory='$HOME/.vim/templates'
let g:username='Yingcheng Liu'
let g:email='liuyc@mit.edu'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               nerdcommenter                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  nerdtree, vim-nerdtree-syntax-highlight                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <22-01-20, YL> "
" reorganize 

" open file list when open file
" autocmd vimenter * NERDTree
" autocmd VimEnter * wincmd l

" quit vim if nerdtree is the last window 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open nerdtree, ;file list
nmap <Leader>fl :NERDTreeToggle<CR>

" window config
let NERDTreeWinSize=22
let NERDTreeWinPos="left"
let NERDTreeMinimalUI=1

" display hidden file 
let NERDTreeShowHidden=1
" ignore file types 
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.DS_Store', '\.swp', '\.git', '\.idea', '__pycache__', '.mypy_cache']

" delete buffer when file is deleted 
let NERDTreeAutoDeleteBuffer=1

" enable highlight 
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 

" highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-easymotion                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <22-01-20, YL> "
" reorganize 

" <leader>c{char} to move to {char}

"map  <leader>s <Plug>(easymotion-bd-f)            
"nmap <leader>s <Plug>(easymotion-overwin-f)

map  f <Plug>(easymotion-bd-w)
nmap f <Plug>(easymotion-overwin-w)
"nmap s <Plug>(easymotion-overwin-f2)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-gitgutter                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <22-01-20, YL> "
" reorganize 

" update git sign every 100ms 
set updatetime=100 

" turn off when too many difference 
let g:gitgutter_max_signs=500 

" next / prev change 
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" turn on signs 
let g:gitgutter_signs=1 

" turn off line highlight 
let g:gitgutter_highlight_lines=0

" set marker 
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'

" costomize color 
let g:gitgutter_override_sign_column_highlight=0

" color 
" highlight SignColumn guibg=#073642 ctermbg=234
hi GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=233
hi GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=233
hi GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=233 

" vim-markdown-preview 
let vim_markdown_preview_github=1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      vim-airline, vim-airline-themes                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <22-01-20, YL> "
" customize vim airline

" airline theme 
let g:airline_theme='powerlineish'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 auto-pairs                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" do not delete in pair 
" let g:AutoPairsMapBS=0

" TODO:  <22-01-20, YL> "
" this is not working 

" do not insert indent 
" let g:AutodPairsMapCR=0

" do not center line 
let g:AutoPairsCenterLine=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                fzf, fzf.vim                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <22-01-20, YL> "
" read fzf, fzf.vim readme 
" use Silver Searcher, see thoughtbot/dotfile  

" search files from root  
nnoremap <c-f> :Files<cr>

" action, imitate nerdtree 
let g:fzf_action={ 'ctrl-i': 'split', 'ctrl-s': 'vsplit' }

" layout 
let g:fzf_layout = { 'down': '~20%' }

" use The Silver Searcher 
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
" TODO:  <08-02-20, YL> "
" update color, this is ugly 
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             dense-analysis/ale                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ale linting events when
" 1. normal or insert mode cursor not moving updatetime 
" 2. insert mode enter or leave 
augroup ale
  autocmd!

  if g:has_async
    autocmd VimEnter *
      \ set updatetime=1000 |
      \ let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
augroup END

" signs 
let g:ale_sign_error='x'
let g:ale_sign_warning='.'

" highlight 
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:ale_set_highlights=0
highlight ALEErrorSign ctermfg=Red ctermbg=233 
highlight ALEWarningSign ctermfg=Yellow ctermbg=233  

" NOTE:: moved to ftplugin 
" fixers 
" let g:ale_fixers = {
" \   'python': ['mypy', 'isort', 'flake8', 'black'],
" \}

" do not fix on save 
" let g:ale_fix_on_save=0

" fix file 
map F :ALEFix<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             gcmt/wildfire.vim                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" text object 
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" NOTE:: enter and bs is good 

" selects next closest text object.
" map <SPACE> <Plug>(wildfire-fuel)

" selects previous closest text object.
" vmap <C-SPACE> <Plug>(wildfire-water)

