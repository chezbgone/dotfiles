" Jason Chen's vimrc
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'chezbgone/ayu-vim'
Plug 'lilydjwg/colorizer'

Plug 'kana/vim-textobj-user'
Plug 'rbonvall/vim-textobj-latex'
Plug 'godlygeek/tabular'
"Plug 'python-mode/python-mode'
"Plug 'Rip-Rip/clang_complete'

Plug 'chrisbra/Recover.vim'
Plug 'vim-airline/vim-airline'

Plug 'SirVer/ultisnips'
Plug 'cohama/lexima.vim'
Plug 'gioele/vim-autoswap'

" YouCompleteMe deprecates clang_complete
function! BuildYCM(info)
	if a:info.status == 'installed' || a:info.force
		!./install.py
	endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Load custom settings
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/commands.vim
source ~/.config/nvim/startup/color.vim
