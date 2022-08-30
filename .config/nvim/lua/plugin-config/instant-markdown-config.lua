return {
  opt = true,
  ft = 'markdown',
  setup =
    function ()
      vim.g.instant_markdown_autostart = 0
      vim.g.instant_markdown_slow = 1
      vim.g.instant_markdown_mathjax = 1
    end
}
