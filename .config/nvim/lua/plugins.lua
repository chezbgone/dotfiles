vim.cmd('packadd packer.nvim')

with_config = function (pack, opt_file)
  return vim.tbl_extend('error', {pack}, require('plugin-config.'..opt_file))
end

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vim-airline/vim-airline-themes'
  use 'NLKNguyen/papercolor-theme'
  use 'mhartington/oceanic-next'
  use 'ayu-theme/ayu-vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'ntpeters/vim-better-whitespace'

  use 'nvim-treesitter/nvim-treesitter' -- {'do': ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'ray-x/cmp-treesitter'

  use 'lervag/vimtex'
  use 'godlygeek/tabular'

  -- Language specific
  use 'kana/vim-textobj-user'
  use 'bps/vim-textobj-python'
  --use 'pangloss/vim-javascript'
  --use 'MaxMEllon/vim-jsx-pretty'
  use 'numirias/semshi' -- {'do': ':UpdateRemotePlugins', 'for': 'python'}
  use 'uiiaoo/java-syntax.vim'
  use 'jackguo380/vim-lsp-cxx-highlight'
  use 'kien/rainbow_parentheses.vim'
  use 'neovimhaskell/haskell-vim'
  use 'whonore/Coqtail'
  use 'bohlender/vim-smt2'
  use 'Julian/lean.nvim'

  -- More text objects
  use 'wellle/targets.vim'
  use 'coderifous/textobj-word-column.vim'

  use 'neovimhaskell/nvim-hs.vim' -- for cornelis
  use 'liuchengxu/vim-which-key' -- for cornelis
  use 'JakobBruenker/cornelis' -- { 'do': 'stack build' }

  -- Auto previews
  use 'suan/vim-instant-markdown' -- {'for': 'markdown'}
  use 'vimwiki/vimwiki'

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

  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'ctrlpvim/ctrlp.vim'

  use 'tpope/vim-fugitive'
  use(with_config('airblade/vim-gitgutter', 'gitgutter-config'))

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'
end)
