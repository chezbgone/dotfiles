nnoremap <buffer> <F1> :w<Enter>:silent !pdflatex <C-r>%<Enter>
inoremap <buffer> <F1> <ESC>:w<Enter>:silent !pdflatex <C-r>%<Enter>
vnoremap <buffer> <F1> <ESC>:w<Enter>:silent !pdflatex <C-r>%<Enter>
nnoremap <buffer> <F2> :silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>
inoremap <buffer> <F2> <ESC>:silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>
vnoremap <buffer> <F2> <ESC>:silent !zathura <C-r>%<BS><BS><BS>pdf &<Enter>

nnoremap <buffer> <F3> :w<Enter>:silent !pdflatex <C-r>% && mv <C-r>%<BS><BS><BS>pdf ..<Enter>
inoremap <buffer> <F3> <ESC>:w<Enter>:silent !pdflatex <C-r>% && mv <C-r>%<BS><BS><BS>pdf ..<Enter>
vnoremap <buffer> <F3> <ESC>:w<Enter>:silent !pdflatex <C-r>% && mv <C-r>%<BS><BS><BS>pdf ..<Enter>
nnoremap <buffer> <F4> :silent !zathura ../<C-r>%<BS><BS><BS>pdf &<Enter>
inoremap <buffer> <F4> <ESC>:silent !zathura ../<C-r>%<BS><BS><BS>pdf &<Enter>
vnoremap <buffer> <F4> <ESC>:silent !zathura ../<C-r>%<BS><BS><BS>pdf &<Enter>

nnoremap <buffer> <F12> :w<Enter>:silent !pdflatex -shell-escape <C-r>%<Enter>
inoremap <buffer> <F12> <ESC>:w<Enter>:silent !pdflatex -shell-escape <C-r>%<Enter>
vnoremap <buffer> <F12> <ESC>:w<Enter>:silent !pdflatex -shell-escape <C-r>%<Enter>

set spell
set spellfile=~/Dropbox/en.utf-8.add

filetype indent off
