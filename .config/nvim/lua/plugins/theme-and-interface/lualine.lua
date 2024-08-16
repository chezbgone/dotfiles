return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'Shatur/neovim-ayu',
  },

  opts = function ()
    local panel_border_bg = '#333333'
    local custom_ayu = require('lualine.themes.ayu')
    custom_ayu.visual.b.bg = panel_border_bg
    custom_ayu.replace.b.bg = panel_border_bg
    custom_ayu.inactive.a.bg = panel_border_bg
    custom_ayu.inactive.b.bg = panel_border_bg
    custom_ayu.inactive.c.bg = panel_border_bg
    custom_ayu.normal.b.bg = panel_border_bg
    custom_ayu.normal.c.bg = panel_border_bg
    custom_ayu.insert.b.bg = panel_border_bg

    return {
      options = {
        component_separators = '',
        section_separators = { left = '', right = '' },
        theme = custom_ayu,
      },
      sections = {
        lualine_x = {
          'encoding',
          {'fileformat', icons_enabled = false},
          'filetype',
        },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
      },
      extensions = { 'nvim-tree', 'fugitive' },
    }
  end,
}
