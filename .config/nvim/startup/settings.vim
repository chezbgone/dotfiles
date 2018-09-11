set ruler " right side of status
set number " line numbers
set linebreak " break lines
set wrap " wrap lines
set breakindent " indent breaks
"set showbreak=>

set autochdir

set nocindent " disables annoying autoindent
set showmatch
set autoread
"set colorcolumn=80
set cursorline

set incsearch " search as characters are entered
set hlsearch " highlight matches

set scrolloff=3 " keep 3 lines above and below the cursor

set tabstop=4
set shiftwidth=4

" More natural splitting
set splitbelow
set splitright

" already run with call plug#end()
syntax on
" filetype plugin indent on

if has('mouse')
	set mouse=a
endif

let g:loaded_AutoClose = 1
autocmd FileType tex let g:loaded_AutoClose = 0
let g:AutoCloseExpandEnterOn="{"

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

let g:UltiSnipsJumpForwardTrigger="§"
