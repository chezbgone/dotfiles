return {
  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate',

  -- init = function(plugin)
  --   -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
  --   -- This is needed because a bunch of plugins no longer `require('nvim-treesitter')`, which
  --   -- no longer trigger the **nvim-treesitter** module to be loaded in time.
  --   -- Luckily, the only things that those plugins need are the custom queries, which we make available
  --   -- during startup.
  --   require('lazy.core.loader').add_to_rtp(plugin)
  --   require('nvim-treesitter.query_predicates')
  -- end,

  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },

  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {
        'latex', -- for spellcheck
      },
    },
    indent = { enable = true },
    sync_install = false,
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'luadoc',
      'luap',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
    },
  },

  main = 'nvim-treesitter.configs',
}
