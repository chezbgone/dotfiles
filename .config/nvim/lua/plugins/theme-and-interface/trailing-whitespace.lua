return {
  'ntpeters/vim-better-whitespace',
  init = function ()
    vim.g.better_whitespace_guicolor = '#660000'
    vim.g.better_whitespace_skip_empty_lines = 1
    vim.g.better_whitespace_filetypes_blacklist = {}
  end,
}
