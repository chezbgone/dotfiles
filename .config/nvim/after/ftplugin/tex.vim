setlocal spell
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=100
syntax sync fromstart
syntax spell toplevel

" Maps
nnoremap <silent> <S-k> <nop>
nnoremap <silent> <leader>hh :syntax sync fromstart<CR>:syntax spell toplevel<CR>

nnoremap <buffer> <F2> :w<Enter>:silent !pdflatex %<Enter>
inoremap <buffer> <F2> <ESC>:w<Enter>:silent !pdflatex %<Enter>
vnoremap <buffer> <F2> <ESC>:w<Enter>:silent !pdflatex %<Enter>
nnoremap <buffer> <F3> :silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>
inoremap <buffer> <F3> <ESC>:silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>
vnoremap <buffer> <F3> <ESC>:silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>

nnoremap <buffer> <F12> :w<Enter>:silent !pdflatex -shell-escape %<Enter>
inoremap <buffer> <F12> <ESC>:w<Enter>:silent !pdflatex -shell-escape %<Enter>
vnoremap <buffer> <F12> <ESC>:w<Enter>:silent !pdflatex -shell-escape %<Enter>

nmap <Leader>a& vie:Tabularize /&\\|\\\\<CR>
vmap <Leader>a& :Tabularize /&\|\\\\<CR>

" Settings
filetype indent off

" Jump to next placeholder
function Select_placeholder()
	execute "norm \<ESC>\<Right>\<Right>\<Right>v\<Left>\<Left>\<Left>\<C-g>"
endfunction
nnoremap <silent> § :if search('<++>', 'c') <bar> call Select_placeholder() <bar> endif <CR>
inoremap <silent> § <ESC>:if search('<++>', 'c') <bar> call Select_placeholder() <bar> endif <CR>

" vim-surround " -> `` ''
let g:surround_34 = "``\r''"
" vim-surround $ -> \( \)
let b:surround_36 = "\\(\r\\)"
" vim-surround c -> \command{ }
let b:surround_99 = "\\\1command: \1{\r}"
" vim-surround e -> \begin{ } \end{ }
let b:surround_101 = "\\begin{\1environment: \1}\r\\end{\1\1}"
" vim-surround t -> \text{ }
let b:surround_116 = "\\text{\r}"

command! TComp silent !kitty --class="latexmk-dock" latexmk -pvc & disown
nmap <F5> :silent TComp<CR>
imap <F5> <C-O><F5>
