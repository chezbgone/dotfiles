set number " line numbers
set relativenumber
set linebreak " break lines
set wrap " wrap lines
set breakindent " indent breaks
set nojoinspaces " one space when joining sentences with J

set inccommand=nosplit " live preview of commands
"set autochdir " set working directory to current file's location

set nocindent " disables annoying autoindent
set showmatch " show matching parens
set cursorline " highlights current line
set colorcolumn=80 " mark 80th character

set scrolloff=3 " keep 3 lines above and below the cursor

set tabstop=4 " show tabs as width 4
set shiftwidth=4 " indenting with > gives 4 spaces
set expandtab " pressing tab gives spaces

set updatetime=500
set pumheight=20

"set spell
set spellfile=~/Dropbox/Keep/VimSpell/en.utf-8.add

" More natural splitting
set splitbelow
set splitright

" Allows for incrementing of letters with <C-A>
set nrformats+=alpha

" save undo tree in files
set undofile
set undolevels=10000

if has('mouse')
	set mouse=a
endif

let g:python_host_prog = '/home/jason/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/jason/.pyenv/versions/neovim3/bin/python'

" airline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections = 1

" closetags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" ctrl-p
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }

" delimimate - try to be smart
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 2

" set nerdtree width
let g:NERDTreeWinSize = 20

let g:UltiSnipsExpandTrigger = "§"
let g:UltiSnipsJumpForwardTrigger = "§"
let g:UltiSnipsJumpBackwardTrigger = "<s-§>"

" if this is not set, then empty .tex files break
" let g:tex_flavor = "latex"
let g:vimtex_compiler_enabled = 0
let g:vimtex_imaps_enabled = 0

" start colorizer
set termguicolors
lua require'colorizer'.setup()

" vim-visual-multi
let g:VM_show_warnings = 0
let g:VM_silent_exit = 1

" ocaml told me to do this
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
