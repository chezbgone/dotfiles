set number " line numbers
set relativenumber
set linebreak " break lines
set wrap " wrap lines
set breakindent " indent breaks

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

" Allows for incrementing of letters with <C-A>
set nrformats+=alpha

if has('mouse')
	set mouse=a
endif

let g:python_host_prog = '/home/jason/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/jason/.pyenv/versions/neovim3/bin/python'

" if this is not set, then empty .tex files break
let g:tex_flavor = "latex"
let g:vimtex_compiler_enabled = 0
let g:vimtex_imaps_enabled = 0

" airline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" set nerdtree width
let g:NERDTreeWinSize = 25

let g:UltiSnipsExpandTrigger = "§"

" Enable Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
	\ 'auto_complete_delay': 100,
	\ 'ignore_sources': {'tex': ['file', 'around', 'buffer']},
	\})

call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})
" Tab goes through deoplete list
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" start c++ syntax highlighting automatically
let g:chromatica#enable_at_startup=1
" update coloring in insert mode
let g:chromatica#responsive_mode=1

" try to be smart
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 2
