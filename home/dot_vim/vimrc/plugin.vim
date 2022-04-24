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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets', {'for': ['javascript', 'typescript', 'jsx', 'tsx']}

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
" Plug 'gcmt/wildfire.vim'
Plug 'terryma/vim-expand-region'

" add surround
Plug 'tpope/vim-surround'

" python docstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" python remove unused import and variables
Plug 'tell-k/vim-autoflake', { 'for': 'python' }

""""""""""""
"  layout  "
""""""""""""

" file list 
Plug 'scrooloose/nerdtree'
" TODO:  fix it <03-07-20, YL> "
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" tag list 
Plug 'majutsushi/tagbar'

" statusline and statusline theme  
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" indent line 
Plug 'Yggdroot/indentLine'

""""""""""""""""
"  navigation  "
""""""""""""""""

" navigation across text 
Plug 'phaazon/hop.nvim'

" search 
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" better f 
Plug 'rhysd/clever-f.vim'

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

" syntax highlight: typescript
Plug 'leafgarland/typescript-vim'

call plug#end() 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               coc.nvim                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" modified from coc.nvim default config

" avoid conflicting with node in virtual/conda environment
let g:coc_node_path = trim(system('which node'))

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <leader>jd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Find and open definition split / vsplit
nmap <leader>ji <cmd>call CocAction('jumpDefinition', 'split')<CR>
nmap <leader>js <cmd>call CocAction('jumpDefinition', 'vsplit')<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc snippets

" Use <C-f> for trigger snippet expand.
imap <C-f> <Plug>(coc-snippets-expand)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim-snippets                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal_snippets"]
" Just to remove UltiSnipsExpandTrigger function
let g:UltiSnipsExpandTrigger="<nop>"
"let g:UltiSnipsJumpForwardTrigger="<c-n>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ultisnips_python_style="google"
let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_triple_quoting_style="double"

"let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 ultisnips                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snips_author="YL"  " author name tag in codes 
let g:snips_email="liuyc@mit.edu"
let g:snips_github="https://github.com/firstmover"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-template                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:templates_directory='$HOME/.vim/templates'
let g:templates_search_height=2
let g:username='Yingcheng Liu'
let g:email='liuyc@mit.edu'

nnoremap <leader>t :Template<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               nerdcommenter                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
" TODO: fix it set 1 will get 2 spaces <09-01-22, YL> "
let g:NERDSpaceDelims = 0

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

" open nerdtree, ;file list
nnoremap <Leader>fl :NERDTreeToggle<CR>

" window config
let NERDTreeWinSize=32
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
"                                   tagbar                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup nerdtree_tagbar
  autocmd!

  " open nerd tree and tag bar on opening files 
  autocmd VimEnter * NERDTree
  autocmd VimEnter * nested :TagbarOpen

  " move cursor from nerd tree to left pane
  autocmd VimEnter * wincmd l 

  " quit vim if nerdtree is the last window 
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END

nnoremap <Leader>tl: TagbarToggle<CR> 

" window size 
let g:tagbar_vertical = 32
let g:tagbar_width=32

" remove help info
let g:tagbar_compact=1

" track variables when editing file
let g:tagbar_autoshowtag = 1 
let g:tagbar_autofocus=1

" not sort
let g:tagbar_sort=0

" default unfold
let g:tagbar_foldlevel=99

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               phaazon/hop.nvim                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set up lua hop every time enter 
augroup hop_nvim
  autocmd!
  autocmd VimEnter * lua require'hop'.setup() 
augroup END

" use easymotion keybindings 
" NOTE: use : to map command will not work in visual mode
map <Leader><Leader>j <cmd>HopLineAC<cr>
map <Leader><Leader>k <cmd>HopLineBC<cr>
map <Leader><Leader>h <cmd>HopWordBC<cr>
map <Leader><Leader>l <cmd>HopWordAC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 incsearch,                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove highlight after search 
let g:incsearch#auto_nohlsearch = 1

" incsearch 
" TODO: nnoremap does not work. why? <09-01-22, YL> "
" TODO: something wrong with hightlights and it is slow 
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

" fuzzy incsearch
" TODO: not used often in practise. remove it. <09-01-22, YL> "
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             rhysd/clever-f.vim                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" smart case 
let g:clever_f_smart_case=1

" use Search color 
let g:clever_f_mark_char=1
let g:clever_f_mark_char_color = "Search"

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
nnoremap ]c <Plug>(GitGutterNextHunk)
nnoremap [c <Plug>(GitGutterPrevHunk)

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
autocmd VimEnter,Colorscheme * :hi GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=232
autocmd VimEnter,Colorscheme * :hi GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=232
autocmd VimEnter,Colorscheme * :hi GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=232

" vim-markdown-preview 
let vim_markdown_preview_github=1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      vim-airline, vim-airline-themes                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  <22-01-20, YL> "
" customize vim airline

" airline on top 
" TODO: this is not working <26-09-20, YL> "
" let g:airline_statusline_ontop=1

" airline theme 
let g:airline_theme='lucius'
"let g:airline_solarized_bg='dark'

" NOTE: this is not working 
"let g:airline#extensions#coc#enabled=0

" remove extensior print 
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c'],
      \ [ 'z' ]
      \ ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             indentLine                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'

" let g:indentLine_bgcolor_term = darkgray
" let g:indentLine_bgcolor_gui = '#FF5F00'

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
" let g:fzf_layout = { 'down': '~20%' }
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" top to bottom
let $FZF_DEFAULT_OPTS="--reverse "

" use The Silver Searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in fzf for listing files. Lightning fast and respects .gitignore
    let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

endif

" use ripgrep for string match
if executable('rg')

    " Tell FZF to use RG - so we can skip .gitignore files even if not using
    " :GitFiles search
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
    " If you want gitignored files:
    " let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

    function! RipgrepFzf(query, fullscreen)
        " NOTE: remove --column will disable preview 
        " NOTE: the match color is wrong when remove reload 
        let command_fmt = 'rg --fixed-strings --column --line-number --no-heading --color=always --smart-case --colors line:fg:white --colors line:style:bold --colors path:fg:075 --colors path:style:bold --colors match:fg:166 --colors match:style:bold %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

    " search word under cursor
    nnoremap <silent> <Leader>s :RG <C-R><C-W><CR>

    " open rf serach engine
    nnoremap <silent> <c-s> <cmd>RG <CR>

endif 

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
    echoerr "The dotfiles require NeoVim or Vim 8"
  endif
augroup END

" signs 
let g:ale_sign_error='x'
let g:ale_sign_warning='.'

" highlight 
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:ale_set_highlights=0
autocmd VimEnter,Colorscheme * :hi ALEErrorSign ctermfg=Red ctermbg=232
autocmd VimEnter,Colorscheme * :hi ALEWarningSign ctermfg=Yellow ctermbg=232

" do not fix on save 
" let g:ale_fix_on_save=0

" fix file 
nnoremap H :ALEFix<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   terryma/vim-expand-region                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <enter> <Plug>(expand_region_expand)
map <backspace> <Plug>(expand_region_shrink)

" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1, 
      \ 'ib'  :1, 
      \ 'iB'  :1, 
      \ 'ip'  :0,
      \ }
