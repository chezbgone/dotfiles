set number " line numbers
set relativenumber
set linebreak " break lines
set wrap " wrap lines
set breakindent " indent breaks
set nojoinspaces " one space when joining sentences with J

set inccommand=nosplit " live preview of commands

set nocindent " disables annoying autoindent
set showmatch " show matching parens
"set cursorline " highlights current line (disabled because causes lag?)
set colorcolumn=80 " mark 80th character

set scrolloff=3 " keep 3 lines above and below the cursor

set tabstop=2 " show tabs as width 4
set shiftwidth=2 " indenting with > gives 4 spaces
set expandtab " pressing tab gives spaces

set updatetime=500
set pumheight=20

"set spell
set spellfile=~/Dropbox/keep/vimspell/en.utf-8.add

" More natural splitting
set splitbelow
set splitright

" Allows for incrementing of letters with <C-A>
set nrformats+=alpha

" save undo tree in files
set undofile
set undolevels=10000

if has('mouse')
	set mouse=a
endif

let mapleader="\<Space>"

let g:python_host_prog = '/home/jason/.local/share/pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/jason/.local/share/pyenv/versions/neovim3/bin/python'

" -------------
" -- PLUGINS --
" -------------

" lualine stuff
lua << END
require('lualine').setup {
  options = {
    theme = 'OceanicNext',
    component_separators = '',
    section_separators = { left = '', right = '' }
  },
  sections = {
    lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'}
  }
}
END

" closetags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" ctrl-p
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }

" set nerdtree width
let g:NERDTreeWinSize = 20

" let g:UltiSnipsExpandTrigger = "§"
" let g:UltiSnipsJumpForwardTrigger = "§"
" let g:UltiSnipsJumpBackwardTrigger = "<s-§>"

" if this is not set, then empty .tex files break
" let g:tex_flavor = "latex"
let g:vimtex_compiler_enabled = 0
let g:vimtex_imaps_enabled = 0

" start colorizer
set termguicolors
lua require'colorizer'.setup()

" vim-visual-multi
let g:VM_show_warnings = 0
let g:VM_silent_exit = 1

" vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_mathjax = 1

" vim-wiki
let g:vimwiki_list = [{ 'path': '~/Dropbox/vimwiki/'
                     \, 'path_html': '~/Dropbox/vimwiki/site/'
                     \, 'name': 'Journal'
                     \, 'auto_export': 1
                     \, 'auto_toc': 1
                     \, 'index': 'main'
                     \, 'links_space_char': '_'
                     \, 'diary_rel_path': 'journal/'
                     \, 'diary_index': 'journal'
                     \, 'diary_header': 'Journal'
                     \}]

" gitgutter
set signcolumn=no
let g:gitgutter_highlight_linenrs = 1
