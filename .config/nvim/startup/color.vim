let g:PaperColor_Theme_Options = {
	\	'theme': {
	\		'default.dark': {
	\			'transparent_background': 1,
	\			'override': {
	\				'linenumber_fg': ['#888888']
	\			}
	\ 		}
	\	}
	\ }

set termguicolors
set background=dark
colorscheme PaperColor
let g:airline_theme='ayu_dark'

"colorscheme ayu
"colorscheme janah

" transparent background
" exists in PaperColor already
"hi Normal guibg=NONE ctermbg=NONE

highlight ExtraWhitespace guibg=darkred
let g:better_whitespace_skip_empty_lines=1
