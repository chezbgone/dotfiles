setlocal nospell
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal signcolumn=yes

nnoremap <silent> <leader>er :Semshi error<CR>
nmap <silent> <leader>re :Semshi rename<CR>

nmap <f5> :silent !kitty --hold python % & disown <cr>
vmap <f5> <esc>:silent !kitty --hold python % & disown <cr>

hi semshiSelected guibg=#0055AA

let delimitMate_nesting_quotes = ['"']
