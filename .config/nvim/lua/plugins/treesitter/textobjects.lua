return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function ()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- automatically jump to next textobject
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["g>"] = "@parameter.inner",
          },
          swap_previous = {
            ["g<"] = "@parameter.inner",
          },
        },
      },
    })
  end
}
