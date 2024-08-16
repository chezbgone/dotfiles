-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function ()
    vim.highlight.on_yank({higroup='Visual', timeout=300})
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function ()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("DisableWhitespace")
  end,
})
