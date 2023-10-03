return {
  config =
    function ()
      local opts = { noremap = true }
      vim.api.nvim_set_keymap('n', '<C-w><c-w>', '<cmd>WinShift<cr>', opts)
      vim.api.nvim_set_keymap('n', '<C-w><up>', '<cmd>WinShift up<cr>', opts)
      vim.api.nvim_set_keymap('n', '<C-w><down>', '<cmd>WinShift down<cr>', opts)
      vim.api.nvim_set_keymap('n', '<C-w><left>', '<cmd>WinShift left<cr>', opts)
      vim.api.nvim_set_keymap('n', '<C-w><right>', '<cmd>WinShift right<cr>', opts)
    end
}
