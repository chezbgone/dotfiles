return {
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config =
    function ()
      require('lualine').setup({
        options = {
          theme = 'OceanicNext',
          component_separators = '',
          section_separators = { left = '', right = '' }
        },
        sections = {
          lualine_x = {
            'encoding',
            {'fileformat', icons_enabled = false},
            'filetype'
          }
        },
      })
    end
}
