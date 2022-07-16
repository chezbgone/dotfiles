"Jason Chen's vimrc
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'

Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
Plug 'norcalli/nvim-colorizer.lua' " Makes hex codes have colored backgrounds
Plug 'ntpeters/vim-better-whitespace'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'ray-x/cmp-treesitter'

Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'

" Language specific
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
"Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'uiiaoo/java-syntax.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'whonore/Coqtail'
Plug 'bohlender/vim-smt2'
Plug 'Julian/lean.nvim'

Plug 'neovimhaskell/nvim-hs.vim' " for cornelis
Plug 'liuchengxu/vim-which-key' " for cornelis
Plug 'JakobBruenker/cornelis', { 'do': 'stack build' }

" Auto previews
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'vimwiki/vimwiki'

Plug 'chrisbra/Recover.vim'
Plug 'gioele/vim-autoswap'

" Plug 'SirVer/ultisnips'

Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-swap'
Plug 'alvan/vim-closetag', {'for': ['html', 'javascript']}
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi'

Plug 'nvim-lualine/lualine.nvim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'ray-x/lsp_signature.nvim'

call plug#end()

" Load custom settings
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/commands.vim
source ~/.config/nvim/startup/color.vim
lua require('chezlsp')
lua require('chezother')
" lua require('lean') " broken
