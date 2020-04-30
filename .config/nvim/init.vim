"Jason Chen's vimrc
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lilydjwg/colorizer' " Makes hex codes have colored backgrounds
Plug 'ntpeters/vim-better-whitespace'

Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'

"Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Python syntax highlighting
"Plug 'bfrg/vim-cpp-modern'

" Auto previews
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

Plug 'chrisbra/Recover.vim'
Plug 'gioele/vim-autoswap'

Plug 'SirVer/ultisnips'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-swap'
Plug 'alvan/vim-closetag', {'for': ['html', 'javascript']}
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'

"Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
call plug#end()

" Load custom settings
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/commands.vim
source ~/.config/nvim/startup/color.vim
