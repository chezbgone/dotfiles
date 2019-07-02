" Jason Chen's vimrc
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'mhinz/vim-janah'
Plug 'chezbgone/ayu-vim'
Plug 'lilydjwg/colorizer'

"Plug 'kana/vim-textobj-user'
"Plug 'rbonvall/vim-textobj-latex'
Plug 'lervag/vimtex'

Plug 'godlygeek/tabular'
"Plug 'python-mode/python-mode'
"Plug 'Rip-Rip/clang_complete'
Plug 'pangloss/vim-javascript'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'chrisbra/Recover.vim'
Plug 'vim-airline/vim-airline'

Plug 'SirVer/ultisnips'
"Plug 'cohama/lexima.vim'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'gioele/vim-autoswap'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

" Load custom settings
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/commands.vim
source ~/.config/nvim/startup/color.vim
