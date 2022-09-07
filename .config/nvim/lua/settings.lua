vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.joinspaces = false -- one space when joining sentences with J

vim.opt.inccommand = 'nosplit' -- live preview of commands

vim.opt.cindent = false -- disables annoying autoindent
vim.opt.showmatch = true -- show matching parens

vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1' -- mark character after textwidth

vim.opt.scrolloff = 3 -- keep 3 lines above and below the cursor

vim.opt.expandtab = true -- pressing tab gives spaces
vim.opt.tabstop = 2 -- show tabs as width 2
vim.opt.shiftwidth = 2 -- indenting with >> gives 2 spaces

vim.opt.updatetime = 500
vim.opt.pumheight = 20

vim.opt.spellfile = '~/Dropbox/keep/vimspell/en.utf-8.add'

-- More natural splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false-- don't resize splits to be equal when closing one

-- Allows for incrementing of letters with <C-A>
vim.opt.nrformats:append({'alpha'})

-- save undo tree in files
vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.mouse = 'a'

-- use filetype.lua
vim.g.do_filetype_lua = 1

vim.g.mapleader = ' '

vim.g.python_host_prog = '/home/jason/.local/share/pyenv/versions/neovim2/bin/python'
vim.g.python3_host_prog = '/home/jason/.local/share/pyenv/versions/neovim3/bin/python'
