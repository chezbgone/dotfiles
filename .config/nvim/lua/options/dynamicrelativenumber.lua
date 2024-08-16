vim.g.collaborative = false

vim.api.nvim_create_augroup('ToggleRelativeNumber', {})
vim.api.nvim_create_autocmd({'InsertEnter'}, {
  group = 'ToggleRelativeNumber',
  callback = function ()
    vim.opt.relativenumber = false
  end
})
vim.api.nvim_create_autocmd({'InsertLeave'}, {
  group = 'ToggleRelativeNumber',
  callback = function ()
    if vim.g.collaborative then
      vim.opt.relativenumber = false
    else
      vim.opt.relativenumber = true
    end
  end
})

