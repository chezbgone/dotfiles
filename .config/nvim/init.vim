" Jason Chen's vimrc
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'chezbgone/ayu-vim' " Theme
Plug 'lilydjwg/colorizer' " Makes hex codes have colored backgrounds

Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'

Plug 'pangloss/vim-javascript'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Python syntax hihglighting

Plug 'chrisbra/Recover.vim'
Plug 'gioele/vim-autoswap'

Plug 'SirVer/ultisnips'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-swap'
Plug 'vim-scripts/HTML-AutoCloseTag'

Plug 'vim-airline/vim-airline'
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
