setlocal nospell
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal signcolumn=yes

nnoremap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <f5> :silent !kitty --hold python % & disown <cr>
vmap <f5> <esc>:silent !kitty --hold python % & disown <cr>

hi semshiSelected guibg=#0055AA

let delimitMate_nesting_quotes = ['"']
