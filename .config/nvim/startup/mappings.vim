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

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

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
nnoremap <silent> <leader>v  :vsp<CR>
nnoremap <silent> <leader>vt :vsp<CR>:terminal<CR><C-\><C-n>

nnoremap <silent> <leader>V  :split<CR>
nnoremap <silent> <leader>Vt :split<CR>:terminal<CR><C-\><C-n>

nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>L :wincmd L<CR>
nnoremap <silent> <leader>H :wincmd H<CR>
nnoremap <silent> <leader>K :wincmd K<CR>
nnoremap <silent> <leader>J :wincmd J<CR>

" Disable F1
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Disable highlighting
nnoremap <silent> <leader>; :noh<CR>

" Disable Ex-Mode
nnoremap Q <NOP>
map q: <NOP>

" Getting out of the terminal emulator
tnoremap <Esc> <C-\><C-n>

" Bubble lines
nmap <silent> <C-Up> :let @t=@"<CR>ddkP:let @"=@t<CR>
nmap <silent> <C-Down> :let @t=@"<CR>ddp:let @"=@t<CR>

" Surround text with brackets
vnoremap <silent> <leader>( :let @t=@"<CR>xi()<Esc>P:let @"=@t<CR>
vnoremap <silent> <leader>[ :let @t=@"<CR>xi[]<Esc>P:let @"=@t<CR>
vnoremap <silent> <leader>{ :let @t=@"<CR>xi{}<Esc>P:let @"=@t<CR>
vnoremap <silent> <leader>$ :let @t=@"<CR>xi\(\)<Esc>hP:let @"=@t<CR>
vnoremap <silent> <leader>" :let @t=@"<CR>xi""<Esc>P:let @"=@t<CR>
vnoremap <silent> <leader>' :let @t=@"<CR>xi''<Esc>P:let @"=@t<CR>

nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <F12> :NERDTreeToggle<CR>
