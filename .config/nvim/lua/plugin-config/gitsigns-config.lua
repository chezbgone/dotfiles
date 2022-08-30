return {
  config =
    function ()
      require('gitsigns').setup({
        signcolumn = false,
        numhl = true,
      })
    end
}
