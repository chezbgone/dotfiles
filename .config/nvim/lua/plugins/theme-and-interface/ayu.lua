return {
  'Shatur/neovim-ayu',
  opts = {
    overrides = {
      Error = { bg = '#501010' },
      Comment = { fg = '#888888' },
      LineNr = { fg = '#777777' },
      MatchParen = { fg = '#c6c6c6', bg = '#4e4e4e' },
      Visual = { bg = '#174488', },
      Normal = { fg = '#e0e0e0' },
      Directory = { fg = '#999999' },
      WinSeparator = { fg = '#4e4e4e' },
      ColorColumn = { bg = '#333333' },
      Folded = { fg = '#445566' },
      NormalFloat = { bg = '#2a2a30' },
      DiagnosticError = { fg = '#ee8888' },
      LspCodeLens = { fg = '#777777' },
      lualine_c_inactive = { bg = '#333333' },
      ['@text.emphasis'] = { italic = true },
    },
  },
  config = function(_, opts)
    require('ayu').setup(opts)
    require('ayu').colorscheme()
  end,
}
