" -------------
" -- PLUGINS --
" -------------

" closetags
lua vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" ctrl-p
lua vim.g.ctrlp_custom_ignore = { dir = 'node_modules' }
lua vim.g.ctrlp_root_markers = {'.ctrlp-root'}

" set nerdtree width
lua vim.g.NERDTreeWinSize = 20

lua vim.g.vimtex_compiler_enabled = 0
lua vim.g.vimtex_imaps_enabled = 0

" start colorizer
lua vim.opt.termguicolors = true
lua require('colorizer').setup()

" vim-visual-multi
lua vim.g.VM_show_warnings = 0
lua vim.g.VM_silent_exit = 1
