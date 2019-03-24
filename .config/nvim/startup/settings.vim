set number " line numbers
set linebreak " break lines
set wrap " wrap lines
set breakindent " indent breaks
"set showbreak=>

set autochdir " set working directory to current file's location

set nocindent " disables annoying autoindent
set showmatch " show matching parens
set cursorline " highlights current line

set scrolloff=3 " keep 3 lines above and below the cursor

set tabstop=4 " show tabs as width 4
set shiftwidth=4 " indenting with > gives 4 spaces
set noexpandtab " pressing tab does not gives spaces

"set spell
set spellfile=~/Dropbox/Keep/VimSpell/en.utf-8.add

" More natural splitting
set splitbelow
set splitright

" already run with call plug#end()

if has('mouse')
	set mouse=a
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

let g:NERDTreeWinSize = 25

let g:UltiSnipsJumpForwardTrigger = "§"

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = { 'tex': 1 }

" don't let <CR> do weird things with ycm
let g:lexima_nvim_accept_pum_with_enter = 0
