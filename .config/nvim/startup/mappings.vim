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

"let mapleader = "\<Space>"

" Fix most recent spelling error to top suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" crtl-e scrolls down (past end) in insert mode
inoremap <C-e> <C-\><C-o><C-e>

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-\><C-o>:w<CR>

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

" Disable F1
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Disable highlighting
nnoremap <silent> <bslash><space> :noh<CR>

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
" use <cr> to complete (even if nothing selected)
imap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Plug>delimitMateCR"

" vim-sneak
let g:sneak#s_next = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
map <Leader>f <Plug>Sneak_s
map <Leader>F <Plug>Sneak_S


""" coc.nvim
if has_key(plugs, 'coc.nvim')
  " always show signcolumn so it doesnt shift back and forth
  set signcolumn=yes

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Show actions.
  nnoremap <silent> <Leader>aa :CocAction<CR>
  " Show commands.
  nnoremap <silent> <Leader>c  :<C-u>CocList commands<CR>
  " Get outline
  nnoremap <silent> <Leader>go :<C-u>CocList outline<CR>

  " Get hint
  nnoremap <silent> <Leader>gh :call CocActionAsync('doHover')<CR>
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  " Go to definitions, etc.
  nnoremap <silent> <Leader>gd <Plug>(coc-definition)
  nnoremap <silent> <Leader>gy <Plug>(coc-type-definition)
  nnoremap <silent> <Leader>gi <Plug>(coc-implementation)

  " Symbol renaming.
  nnoremap <leader>rn <Plug>(coc-rename)

  " Applying codeAction to the selected region.
  xmap <leader>a <Plug>(coc-codeaction-selected)
  nmap <leader>a <Plug>(coc-codeaction-selected)
  " Remap keys for applying codeAction to the current buffer.
  "nmap <leader>ac  <Plug>(coc-codeaction)

  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " function and class text-objects
  xnoremap if <Plug>(coc-funcobj-i)
  xnoremap af <Plug>(coc-funcobj-a)
  onoremap if <Plug>(coc-funcobj-i)
  onoremap af <Plug>(coc-funcobj-a)
  xnoremap ic <Plug>(coc-classobj-i)
  xnoremap ac <Plug>(coc-classobj-a)
  onoremap ic <Plug>(coc-classobj-i)
  onoremap ac <Plug>(coc-classobj-a)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif
