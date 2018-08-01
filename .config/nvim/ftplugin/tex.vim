nnoremap <buffer> <F1> :w<Enter>
inoremap <buffer> <F1> <ESC>:w<Enter>
vnoremap <buffer> <F1> <ESC>:w<Enter>

nnoremap <buffer> <F2> :w<Enter>:silent !pdflatex %<Enter>
inoremap <buffer> <F2> <ESC>:w<Enter>:silent !pdflatex %<Enter>
vnoremap <buffer> <F2> <ESC>:w<Enter>:silent !pdflatex %<Enter>
nnoremap <buffer> <F3> :silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>
inoremap <buffer> <F3> <ESC>:silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>
vnoremap <buffer> <F3> <ESC>:silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>

nnoremap <buffer> <F4> :w<Enter>:silent !pdflatex <C-r>% && mv <C-r>%<BS><BS><BS>pdf ..<Enter>
inoremap <buffer> <F4> <ESC>:w<Enter>:silent !pdflatex <C-r>% && mv <C-r>%<BS><BS><BS>pdf ..<Enter>
vnoremap <buffer> <F4> <ESC>:w<Enter>:silent !pdflatex <C-r>% && mv <C-r>%<BS><BS><BS>pdf ..<Enter>
nnoremap <buffer> <F5> :silent !zathura ../<C-r>%<BS><BS><BS>pdf &<Enter>
inoremap <buffer> <F5> <ESC>:silent !zathura ../<C-r>%<BS><BS><BS>pdf &<Enter>
vnoremap <buffer> <F5> <ESC>:silent !zathura ../<C-r>%<BS><BS><BS>pdf &<Enter>

nnoremap <buffer> <F12> :w<Enter>:silent !pdflatex -shell-escape %<Enter>
inoremap <buffer> <F12> <ESC>:w<Enter>:silent !pdflatex -shell-escape %<Enter>
vnoremap <buffer> <F12> <ESC>:w<Enter>:silent !pdflatex -shell-escape %<Enter>

set spell
set spellfile=~/Dropbox/en.utf-8.add

filetype indent off
