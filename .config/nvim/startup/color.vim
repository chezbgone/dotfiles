let g:PaperColor_Theme_Options = {
	\	'theme': {
	\		'default.dark': {
	\			'transparent_background': 1,
	\			'override': {
	\				'linenumber_fg': ['#777777'],
	\				'visual_bg': ['#174488'],
	\				'visual_fg': ['#88CCFF'],
	\			}
	\ 		}
	\	}
	\ }

set termguicolors
set background=dark
"let g:airline_theme='ayu_dark'
let g:airline_theme='deus'

"colorscheme PaperColor
colorscheme ayu
"colorscheme janah
"colorscheme OceanicNext

" transparent background
" exists in PaperColor already
hi Normal guibg=NONE ctermbg=NONE

highlight ExtraWhitespace guibg=darkred
let g:better_whitespace_skip_empty_lines=1

highlight CocHighlightText guibg=#555555
highlight SignColumn guibg=NONE
highlight Pmenu guibg=#113355

" for ayu (dark)
highlight Comment guifg=#666666
highlight LineNr guifg=#777777
highlight MatchParen gui=NONE guifg=#c6c6c6 guibg=#4e4e4e
highlight ColorColumn guibg=#282828
highlight Visual guibg=#174488
highlight Normal guifg=#e0e0e0
highlight Directory guifg=#999999
highlight VertSplit guifg=#4e4e4e
