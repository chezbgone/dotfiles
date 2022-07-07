nnoremap <buffer> <leader>l :CornelisLoad<CR>
nnoremap <buffer> <leader>r :CornelisRefine<CR>
nnoremap <buffer> <leader>d :CornelisMakeCase<CR>
nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
nnoremap <buffer> <leader>n :CornelisSolve<CR>
nnoremap <buffer> <leader>a :CornelisAuto<CR>
nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
nnoremap <buffer> <leader>[ :CornelisPrevGoal<CR>
nnoremap <buffer> <leader>] :CornelisNextGoal<CR>

call cornelis#bind_input("forall", "∀")
call cornelis#bind_input("exists", "∃")
call cornelis#bind_input("leq", "≤")
call cornelis#bind_input("geq", "≥")
call cornelis#bind_input("equiv", "≡")
call cornelis#bind_input("lambda", "λ")

au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"

function! CornelisLoadWrapper()
  if exists(":CornelisLoad") ==# 2
    CornelisLoad
  endif
endfunction

call CornelisLoadWrapper()
