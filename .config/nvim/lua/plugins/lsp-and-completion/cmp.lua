return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',

  dependencies = {
    -- sources
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',

    'dcampos/cmp-snippy',
  },

  config = function ()
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('snippy').expand_snippet(args.body)
        end,
      },
      completion = { keyword_length = 3 },
      mapping = {
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          --{ name = 'snippy' },
        },
        {
          { name = 'buffer' },
        }
      ),
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    cmp.setup.filetype('tex', { enabled = false })
  end,
}
