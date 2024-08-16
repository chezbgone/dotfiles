return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    use_default_keymaps = false,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["gs"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["gv"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["-"] = "actions.parent",
      ["gh"] = 'actions.parent',
      ["gp"] = "actions.preview",
      ["g."] = "actions.toggle_hidden",
    },
    view_options = {
      show_hidden = false,
    },
  },
}
