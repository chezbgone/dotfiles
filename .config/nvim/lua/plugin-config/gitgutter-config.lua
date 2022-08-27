return {
  config =
    function ()
      vim.opt.signcolumn = 'no'
      vim.g.gitgutter_highlight_linenrs = 1
      vim.cmd('highlight link GitGutterAddLineNr    GitGutterAdd   ')
      vim.cmd('highlight link GitGutterChangeLineNr GitGutterChange')
      vim.cmd('highlight link GitGutterDeleteLineNr GitGutterDelete')
      vim.cmd('highlight link GitGutterChangeLineNr GitGutterChange')
    end
}
