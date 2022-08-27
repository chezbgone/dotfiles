require ('plugins')

-- Load custom settings
vim.cmd("source ~/.config/nvim/startup/settings.vim")
vim.cmd("source ~/.config/nvim/startup/mappings.vim")
vim.cmd("source ~/.config/nvim/startup/commands.vim")
vim.cmd("source ~/.config/nvim/startup/color.vim")
require('chezlsp')
require('chezother')
