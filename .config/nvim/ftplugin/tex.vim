setlocal spell
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

" Maps
nnoremap <buffer> <F1> :w<Enter>
inoremap <buffer> <F1> <ESC>:w<Enter>
vnoremap <buffer> <F1> <ESC>:w<Enter>

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
	execute "norm \<ESC>gh\<Right>\<Right>\<Right>"
endfunction
inoremap <silent> § <ESC>:if search('<++>', 'c') <bar> call Select_placeholder() <bar> endif <CR>
nnoremap <silent> § :if search('<++>', 'c') <bar> call Select_placeholder() <bar> endif <CR>

" vim-surround $ -> \( \)
let b:surround_36 = "\\(\r\\)"

" Stop delimitMate from autocompleting these in LaTeX
let delimitMate_matchpairs=&matchpairs.",`:'"
let delimitMate_quotes="\""
imap <expr> ( getline(".")[col(".") - 2] == '\' ? '(' : "\<Plug>delimitMate("
imap <expr> [ getline(".")[col(".") - 2] == '\' ? '[' : "\<Plug>delimitMate["
" Also \begin{
imap <expr> { getline(".")[col(".") - 7: col(".") - 2] == '\\begin' ? '{' : "\<Plug>delimitMate{"

command! TComp silent !kitty latexmk -pvc & disown
nmap <F5> :silent TComp<CR>
imap <F5> <C-O><F5>
"nmap <Leader>TC :silent TComp<CR>
