return {
  run =
    function ()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  config =
    function ()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = false,
          additional_vim_regex_highlighting = {
            'latex', -- for spellcheck
          },
        },
      })
    end
}
