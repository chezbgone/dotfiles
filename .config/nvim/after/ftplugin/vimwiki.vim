setlocal nowrap
setlocal foldmarker=《,》

if !exists("b:setup_done")
  nunmap <buffer> <Tab>
  nunmap <buffer> <S-Tab>

  autocmd BufWritePost main.wiki silent! !python ~/scripts/vimwiki_main_template.py
  autocmd BufWritePost main.wiki edit
  autocmd BufWritePost main.wiki redraw!
endif
let b:setup_done = 1

" use textobj-word-column.vim instead of the vimwiki column text object
ounmap <buffer> ac
vunmap <buffer> ac
ounmap <buffer> ic
vunmap <buffer> ic
