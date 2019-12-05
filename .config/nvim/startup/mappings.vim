" No arrow keys >:D
"nnoremap <Up> <NOP>
"nnoremap <Down> <NOP>
"nnoremap <Left> <NOP>
"nnoremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
"vnoremap <Up> <NOP>
"vnoremap <Down> <NOP>
"vnoremap <Left> <NOP>
"vnoremap <Right> <NOP>

" H and L move to beginning and end of line
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap gH g^
vnoremap gH g^
onoremap gH g^
nnoremap L $
vnoremap L $
onoremap L $
nnoremap gL g$
vnoremap gL g$
onoremap gL g$

nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Fix most recent spelling error to top suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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
nnoremap <leader>ets :split ~/.texmf/tex/latex/chez-sty/chezbase.sty<CR>
nnoremap <leader>etb :e ~/.texmf/tex/latex/chez-sty/chezbase.sty<CR>

" Window commands
nnoremap <silent> <leader>v  :vsp<CR>
nnoremap <silent> <leader>vt :vsp<CR>:terminal<CR><C-\><C-n>

nnoremap <silent> <leader>V  :split<CR>
nnoremap <silent> <leader>Vt :split<CR>:terminal<CR><C-\><C-n>

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <leader>l <c-w>L
nnoremap <leader>h <c-w>H
nnoremap <leader>k <c-w>K
nnoremap <leader>j <c-w>J

" Disable F1
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Disable highlighting
nnoremap <silent> <leader><space> :noh<CR>

" Disable Ex-Mode
nnoremap Q <NOP>
map q: <NOP>

" Disable K
nnoremap K <nop>

" Getting out of the terminal emulator
tnoremap <Esc> <C-\><C-n>

" Get syntax group name under cursor
nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <F12> :NERDTreeToggle<CR>

" use <tab> and <S-tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <cr> to complete (even if nothing selected
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
