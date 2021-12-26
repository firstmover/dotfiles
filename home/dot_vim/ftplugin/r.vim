"""""""""
"  ale  "
"""""""""

let b:ale_linters = {
\   'r': ['lintr']
\}

let b:ale_fixers = {
\   'r': ['styler']
\}

autocmd VimEnter * call ale#Set(
\   'r_styler_options',
\   'tidyverse_style('
\       . 'scope = \"tokens\", '
\       . 'strict = TRUE, '
\       . 'indent_by = 4, '
\       . 'start_comments_with_one_space = TRUE, '
\       . 'reindention = tidyverse_reindention(), '
\       . 'math_token_spacing = tidyverse_math_token_spacing()'
\       . ')'
\)

" do not fix on save 
let b:ale_fix_on_save=0
