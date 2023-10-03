" H and L move to beginning and end of line
nnoremap H ^
xnoremap H ^
onoremap H ^
nnoremap gH g^
xnoremap gH g^
onoremap gH g^
nnoremap L $
xnoremap L $
onoremap L $
nnoremap gL g$
xnoremap gL g$
onoremap gL g$

nnoremap <Tab> >>
nnoremap <S-Tab> <<
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
xnoremap > >gv
xnoremap < <gv

" Fix most recent spelling error to top suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" crtl-e scrolls down (past end) in insert mode
inoremap <C-e> <C-\><C-o><C-e>

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-\><C-o>:w<CR>

" stop { and } from leaving navigation marks
" https://vi.stackexchange.com/questions/11969
nnoremap <silent> } :keepjumps normal! }<cr>
nnoremap <silent> { :keepjumps normal! {<cr>
xnoremap <silent> } :<C-u>keepjumps normal! gv}<cr>
xnoremap <silent> { :<C-u>keepjumps normal! gv{<cr>

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Disable F1
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Disable highlighting
nnoremap <silent> <bslash><space> :nohlsearch<CR>

" Disable Ex-Mode
nnoremap Q <NOP>
map q: <NOP>

" Disable K
nnoremap K <nop>

" Getting out of the terminal emulator
tnoremap <Esc><Esc> <C-\><C-n>

" Get syntax group name under cursor
nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <F12> :NvimTreeToggle<CR>

" use <tab> and <S-tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <cr> to complete (even if nothing selected)

nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>c. :cd ..<CR>:pwd<CR>

" vim-sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
nmap <Leader>f <Plug>Sneak_s
nmap <Leader>F <Plug>Sneak_S
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
xmap <Leader>f <Plug>Sneak_s
xmap <Leader>F <Plug>Sneak_S
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
omap <Leader>f <Plug>Sneakmappingsmap <Leader>F <Plug>Sneak_S
