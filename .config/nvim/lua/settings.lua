---------------
-- Interface --
---------------

vim.opt.number = true
vim.opt.relativenumber = true
local toggleRelativeNumber = vim.api.nvim_create_augroup('ToggleRelativeNumber', {})

-- vim.opt.textwidth = 80 -- breaks lines when they are too long
-- vim.opt.colorcolumn = '+1' -- mark character after textwidth
-- vim.opt.colorcolumn = '81'
vim.opt.showmatch = true -- show matching parens
vim.opt.showmode = false -- status line already shows the mode

vim.opt.updatetime = 500
vim.opt.pumheight = 20

-- use filetype.lua
vim.g.do_filetype_lua = 1

if vim.fn.exists("g:neovide") then
  require('neovide')
end

------------
-- Moving --
------------

vim.opt.mouse = 'a'
vim.opt.scrolloff = 3 -- keep 3 lines above and below the cursor

-- More natural splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false-- don't resize splits to be equal when closing one

vim.g.collaborative = false
vim.api.nvim_create_autocmd({'InsertEnter'}, {
  group = 'ToggleRelativeNumber',
  callback = function ()
    vim.opt.relativenumber = false
  end
})
vim.api.nvim_create_autocmd({'InsertLeave'}, {
  group = 'ToggleRelativeNumber',
  callback = function ()
    if not vim.g.collaborative then
      vim.opt.relativenumber = true
    else
      vim.opt.relativenumber = false
    end
  end
})

-------------
-- Editing --
-------------

vim.g.mapleader = ' '

vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.joinspaces = false -- one space when joining sentences with J

vim.opt.inccommand = 'nosplit' -- live preview of commands

vim.opt.cindent = false -- disables annoying autoindent

vim.opt.expandtab = true -- pressing tab gives spaces
vim.opt.tabstop = 2 -- show tabs as width 2
vim.opt.shiftwidth = 2 -- indenting with >> gives 2 spaces

-- do not use '~' for home, otherwise permission errors
vim.opt.spellfile = '/home/jason/Dropbox/keep/vimspell/en.utf-8.add'

-- Allows for incrementing of letters with <C-A>
vim.opt.nrformats:append({'alpha'})

-- save undo tree in files
vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.g.python_host_prog = '/home/jason/.local/share/pyenv/versions/neovim2/bin/python'
vim.g.python3_host_prog = '/home/jason/.local/share/pyenv/versions/neovim3/bin/python'
