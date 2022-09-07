vim.cmd('packadd packer.nvim')

with_config = function (pack, opt_file)
  return vim.tbl_extend('error', {pack}, require('plugin-config.'..opt_file))
end

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'NLKNguyen/papercolor-theme'
  use 'mhartington/oceanic-next'
  use 'ayu-theme/ayu-vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'ntpeters/vim-better-whitespace'

  use(with_config('nvim-treesitter/nvim-treesitter', 'nvim-treesitter-config'))
  use(with_config('nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter-textobjects-config'))
  use 'nvim-treesitter/playground'
  use 'ray-x/cmp-treesitter'

  use(with_config('lervag/vimtex', 'vimtex-config'))
  use 'godlygeek/tabular'

  -- Language specific
  use 'kana/vim-textobj-user'
  use 'bps/vim-textobj-python'
  -- use 'pangloss/vim-javascript'
  -- use 'MaxMEllon/vim-jsx-pretty'
  -- use 'numirias/semshi' -- {'do': ':UpdateRemotePlugins', 'for': 'python'}
  -- use 'uiiaoo/java-syntax.vim'
  -- use 'jackguo380/vim-lsp-cxx-highlight'
  use 'kien/rainbow_parentheses.vim'
  use 'neovimhaskell/haskell-vim'
  use 'whonore/Coqtail'
  use 'bohlender/vim-smt2'
  use 'Julian/lean.nvim'

  -- More text objects
  use 'wellle/targets.vim'
  use 'coderifous/textobj-word-column.vim'

  use(with_config('isovector/cornelis', 'cornelis-config'))

  -- Auto previews
  use(with_config('suan/vim-instant-markdown', 'instant-markdown-config'))
  use(with_config('vimwiki/vimwiki', 'vimwiki-config'))

  use 'chrisbra/Recover.vim'
  use 'gioele/vim-autoswap'

  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'machakann/vim-swap'
  use 'alvan/vim-closetag' -- {'for': ['html', 'javascript']}
  use 'justinmk/vim-sneak'
  use 'machakann/vim-highlightedyank'
  use 'mg979/vim-visual-multi'

  use(with_config('nvim-lualine/lualine.nvim', 'lualine-config'))

  use(with_config('kyazdani42/nvim-tree.lua', 'nvim-tree-config'))
  use 'ctrlpvim/ctrlp.vim'

  use 'tpope/vim-fugitive'
  use(with_config('lewis6991/gitsigns.nvim', 'gitsigns-config'))

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'
end)
