return {
  'sindrets/winshift.nvim',
  init = function ()
    vim.keymap.set('n', '<C-w><c-w>', '<cmd>WinShift<cr>', opts)
    vim.keymap.set('n', '<C-w><up>', '<cmd>WinShift up<cr>', opts)
    vim.keymap.set('n', '<C-w><down>', '<cmd>WinShift down<cr>', opts)
    vim.keymap.set('n', '<C-w><left>', '<cmd>WinShift left<cr>', opts)
    vim.keymap.set('n', '<C-w><right>', '<cmd>WinShift right<cr>', opts)
  end,
}
