vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- utility / ui
  use 'nathom/filetype.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'stevearc/dressing.nvim'
  use 'editorconfig/editorconfig-vim'

  -- editing enhancements
  use 'numToStr/Comment.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'mg979/vim-visual-multi'

  -- formatting
  use {'jdhao/whitespace.nvim', event = 'VimEnter'}
  use 'godlygeek/tabular'
  use 'AndrewRadev/splitjoin.vim'

  -- productivity
  -- use 'jghauser/follow-md-links.nvim' (commented out while TS markdown stabilises)
  -- use 'lervag/lists.vim'              (commented out while TS markdown stabilises)
  use 'preservim/vim-markdown'

  -- searching
  use 'mhinz/vim-grepper'
  use 'junegunn/fzf.vim'

  -- tpope section
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-characterize'
  use 'tpope/vim-unimpaired'

  -- colours
  use 'dracula/vim'
  use 'nvim-lualine/lualine.nvim'
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

  -- snippets
  use 'peteryates/friendly-snippets'
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
