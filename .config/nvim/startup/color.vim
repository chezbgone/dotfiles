set background=dark
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
colorscheme PaperColor
" colorscheme reclipse
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight LineNr ctermbg=none ctermfg=LightGray
" highlight VertSplit ctermfg=DarkGray ctermbg=LightGray
" highlight StatusLineNC ctermbg=LightGray ctermfg=DarkGray
" highlight CursorLineNr ctermbg=none

" Show trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufEnter * match BadWhitespace /\S\zs\s\+$/

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
let g:rainbow#blacklist = [205]

call rainbow_parentheses#activate()
