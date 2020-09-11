"Jason Chen's vimrc
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'norcalli/nvim-colorizer.lua' " Makes hex codes have colored backgrounds
Plug 'ntpeters/vim-better-whitespace'

Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'

Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
"Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'uiiaoo/java-syntax.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'kien/rainbow_parentheses.vim'

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

if !exists('g:started_by_firenvim')
	Plug 'vim-airline/vim-airline'
endif

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

" Load custom settings
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/commands.vim
source ~/.config/nvim/startup/color.vim

if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif
