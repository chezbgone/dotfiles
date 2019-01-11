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
"set expandtab " pressing tab gives spaces

set spell " opt out vs opt in because I want general files to have spellcheck
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

let g:UltiSnipsJumpForwardTrigger="§"

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

"let g:deoplete#enable_at_startup = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
