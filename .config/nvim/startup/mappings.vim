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

" H and L move to beginning and end of line
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $

" crtl-e scrolls down (past end) in insert mode
inoremap <C-e> <ESC><C-e>a

" Edit init.vim
nnoremap <leader>evs :split ~/.config/nvim/init.vim<CR>
nnoremap <leader>evb :e ~/.config/nvim/init.vim<CR>
" Edit .zshrc
nnoremap <leader>ezs :split $HOME/.zshrc<CR>
nnoremap <leader>ezb :e $HOME/.zshrc<CR>
" Edit jason.sty
nnoremap <leader>ets :split ~/texmf/tex/latex/chez-sty/chezbase.sty<CR>
nnoremap <leader>etb :e ~/texmf/tex/latex/chez-sty/chezbase.sty<CR>

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

" Disable highlighting
nnoremap <leader>; :noh<CR>

" Disable Ex-Mode
nnoremap Q <NOP>
map q: <NOP>

" Getting out of the terminal emulator
tnoremap <Esc> <C-\><C-n>

" Bubble lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Surround text with brackets
vnoremap <leader>( xi()<Esc>P
vnoremap <leader>[ xi[]<Esc>P
vnoremap <leader>{ xi{}<Esc>P
vnoremap <leader>\( xi\(\)<Esc>hP
vnoremap <leader>$ xi$$<Esc>P
vnoremap <leader>" xi""<Esc>P
vnoremap <leader>' xi''<Esc>P

nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <F12> :NERDTreeToggle<CR>
