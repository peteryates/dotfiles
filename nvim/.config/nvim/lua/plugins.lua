vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'AndrewRadev/splitjoin.vim'
  use 'godlygeek/tabular'
  use 'junegunn/fzf.vim'
  use 'mg979/vim-visual-multi'
  use 'mhinz/vim-grepper'
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
  use 'sheerun/vim-polyglot'
  use 'numToStr/Comment.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'stevearc/dressing.nvim'
  use 'editorconfig/editorconfig-vim'
  use 'folke/trouble.nvim'
  use 'vimwiki/vimwiki'
  use 'nathom/filetype.nvim'

  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-characterize'

  -- colours
  use 'dracula/vim'
  use 'nvim-lualine/lualine.nvim'

  -- snippets
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'

  -- lsp stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'williamboman/nvim-lsp-installer'

  -- lsp sources
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-emoji'
  use 'saadparwaiz1/cmp_luasnip'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/nvim-treesitter-context'
end)
