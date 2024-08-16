vim.opt.guifont = { "Hasklig", ":h10" }
vim.g.neovide_scale_factor = 1.0

change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
end

local opts = { noremap = true, silent = true }
vim.keymap.set({'n', 'i'}, "<C-+>", function() change_scale_factor(0.1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() change_scale_factor(-0.1) end, opts)
