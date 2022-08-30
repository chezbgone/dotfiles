" automatically quit if cornelis status window is last buffer
autocmd BufEnter * if (winnr("$") == 1 && exists("b:cornelis_window")) | q | endif

nnoremap <buffer> <leader>l :w<CR>:CornelisLoad<CR>
nnoremap <buffer> <leader>L :CornelisLoad<CR>
nnoremap <buffer> <leader>r :CornelisRefine<CR>
nnoremap <buffer> <leader>c :CornelisMakeCase<CR>
nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
nnoremap <buffer> <leader>s :CornelisSolve<CR>
nnoremap <buffer> <leader>a :CornelisAuto<CR>
nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
nnoremap <buffer> <leader>[ :CornelisPrevGoal<CR>
nnoremap <buffer> <leader>] :CornelisNextGoal<CR>

augroup agda_load
  autocmd BufNewFile *.agda CornelisLoad
  autocmd BufReadPre *.agda CornelisLoad
  autocmd BufReadPre *.lagda.md CornelisLoad
augroup END
