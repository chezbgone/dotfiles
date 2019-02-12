"let g:PaperColor_Theme_Options = { 'theme': { 'default.dark': { 'transparent_background': 1 } } }

set termguicolors
set background=dark
colorscheme ayu
"colorscheme janah

" transparent background
hi Normal guibg=NONE ctermbg=NONE

" Show trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufEnter * match BadWhitespace /\S\zs\s\+$/

