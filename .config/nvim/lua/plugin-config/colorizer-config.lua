return {

  config =
    function ()
      vim.opt.termguicolors = true
      require('colorizer').setup({}, {
        names = false,
      })
    end
}
