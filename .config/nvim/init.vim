" Jason Chen's vimrc
set nocompatible
filetype off

" Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'rafi/awesome-vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'MaxSt/FlatColor'

Plug 'lilydjwg/colorizer'
Plug 'junegunn/rainbow_parentheses.vim'

"Plug 'chezbgone/vim-latex'
"Plug 'python-mode/python-mode'
"Plug 'Rip-Rip/clang_complete'

Plug 'chrisbra/Recover.vim'
Plug 'vim-airline/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'SirVer/ultisnips'
Plug 'Townk/vim-autoclose'

call plug#end()
" End plug

" Load custom settings
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/commands.vim
source ~/.config/nvim/startup/color.vim
