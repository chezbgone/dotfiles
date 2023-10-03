return {
  after = "nvim-treesitter",
  config =
    function ()
      require('neorg').setup({
        load = {
          ["core.defaults"] = {},
          ["core.completion"] = {
            config = {
              engine = 'nvim-cmp'
            }
          },
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                main = "~/Dropbox/neorg",
              },
              index = 'main.norg',
              default_workspace = 'main',
            },
          },
        },
      })
    end,
  requires = "nvim-lua/plenary.nvim",
  run = ':Neorg sync-parsers',
}
