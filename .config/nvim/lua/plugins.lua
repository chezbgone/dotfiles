vim.cmd('packadd packer.nvim')

local with_config = function (pack, opt_file)
  return vim.tbl_extend('error', {pack}, require('plugin-config.'..opt_file))
end

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme/Interface
  use(with_config('Shatur/neovim-ayu', 'ayu-config'))
  use(with_config('norcalli/nvim-colorizer.lua', 'colorizer-config'))
  use(with_config('ntpeters/vim-better-whitespace', 'better-whitespace-config'))
  use(with_config('lewis6991/gitsigns.nvim', 'gitsigns-config'))
  use(with_config('nvim-lualine/lualine.nvim', 'lualine-config'))
  use 'machakann/vim-highlightedyank'

  -- Treesitter
  use(with_config('nvim-treesitter/nvim-treesitter', 'nvim-treesitter-config'))
  use(with_config('nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter-textobjects-config'))
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/playground'

  -- Language specific
  use 'kana/vim-textobj-user'
  use 'bps/vim-textobj-python'
  use 'kien/rainbow_parentheses.vim'
  use 'neovimhaskell/haskell-vim'
  use 'bohlender/vim-smt2'
  use 'edwinb/idris2-vim'
  use(with_config('whonore/Coqtail', 'coqtail-config'))
  use(with_config('lervag/vimtex', 'vimtex-config'))
  use(with_config('suan/vim-instant-markdown', 'instant-markdown-config'))
  use(with_config('isovector/cornelis', 'cornelis-config'))

  -- Behaviors
  use(with_config('echasnovski/mini.starter', 'starter-config'))
  use(with_config('kyazdani42/nvim-tree.lua', 'nvim-tree-config'))
  use(with_config('nvim-neorg/neorg', 'neorg-config'))
  use 'tpope/vim-fugitive'
  use 'chrisbra/Recover.vim'
  use 'gioele/vim-autoswap'

  -- Text Movement/Editing
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'machakann/vim-swap'
  use 'justinmk/vim-sneak'
  use(with_config('dcampos/nvim-snippy', 'nvim-snippy-config'))
  use(with_config('mg979/vim-visual-multi', 'visual-multi-config'))
  use 'coderifous/textobj-word-column.vim'
  use(with_config('echasnovski/mini.ai', 'mini-ai-config'))
  use 'godlygeek/tabular'

  -- File Navigation
  use(with_config('nvim-telescope/telescope.nvim', 'telescope-config'))
  use(with_config('nvim-telescope/telescope-fzf-native.nvim', 'telescope-fzf-config'))
  use(with_config('sindrets/winshift.nvim', 'winshift-config'))

  -- Completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'dcampos/cmp-snippy'
  use 'ray-x/cmp-treesitter'
  use 'ray-x/lsp_signature.nvim'
end)
