" automatically quit if cornelis status window is last buffer
autocmd BufEnter * if (winnr("$") == 1 && exists("b:cornelis_window")) | q | endif

nnoremap <buffer> <leader>l :w<CR>:CornelisLoad<CR>
nnoremap <buffer> <leader>h :CornelisQuestionToMeta<CR>
nnoremap <buffer> <leader>L :w<CR>:CornelisLoad<CR>:CornelisQuestionToMeta<CR>
nnoremap <buffer> <leader>r :CornelisRefine<CR>
nnoremap <buffer> <leader>c :CornelisMakeCase<CR>
nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
nnoremap <buffer> <leader>n :CornelisNormalize<CR>
nnoremap <buffer> <leader>H :CornelisHelperFunc<CR>
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

lua << EOF
local spec_pair = require('mini.ai').gen_spec.pair
vim.b.miniai_config = {
  custom_textobjects = {
    ['<'] = { '\xe2\x9f\xa8%s*().-()%s*\xe2\x9f\xa9' },
    ['>'] = { '\xe2\x9f\xa8().-()\xe2\x9f\xa9' },
  },
}
EOF
