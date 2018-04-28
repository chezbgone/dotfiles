" No arrow keys >:D
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

" Left and right arrow keys indent instead
nnoremap <Left> <<
nnoremap <Right> >>
inoremap <Left> <ESC><<
inoremap <Right> <ESC>>>
vnoremap <Left> <
vnoremap <Right> >

" crtl-e scrolls down (past end) in insert mode
inoremap <C-e> <ESC><C-e>a

" Edit init.vim
nnoremap <leader>evs :split ~/.config/nvim/init.vim<CR>
nnoremap <leader>evb :e ~/.config/nvim/init.vim<CR>
" Edit .zshrc
nnoremap <leader>ezs :split $HOME/.zshrc<CR>
nnoremap <leader>ezb :e $HOME/.zshrc<CR>
" Edit jason.sty
nnoremap <leader>ets :split ~/texmf/tex/latex/chez/chezbase.sty<CR>
nnoremap <leader>etb :e ~/texmf/tex/latex/chez/chezbase.sty<CR>

" Window commands
nnoremap <leader>v  :vsp<CR>
nnoremap <leader>vt :vsp<CR>:terminal<CR><C-\><C-n>

nnoremap <leader>V  :split<CR>
nnoremap <leader>Vt :split<CR>:terminal<CR><C-\><C-n>

nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>L :wincmd L<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>J :wincmd J<CR>

" Disable F1
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Getting out of the terminal emulator
tnoremap <Esc> <C-\><C-n>
