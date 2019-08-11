let g:PaperColor_Theme_Options = { 'theme': { 'default.dark': { 'transparent_background': 1 } } }

set termguicolors
set background=dark
colorscheme PaperColor
"colorscheme ayu
"colorscheme janah

" transparent background
" exists in PaperColor already
"hi Normal guibg=NONE ctermbg=NONE

highlight ExtraWhitespace guibg=darkred
let g:better_whitespace_skip_empty_lines=1
