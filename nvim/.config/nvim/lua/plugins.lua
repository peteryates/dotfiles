require("lazy").setup(
  -- plugins
  {
    -- utility / ui
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
    'editorconfig/editorconfig-vim',
    'nvim-lualine/lualine.nvim',

    -- editing enhancements
    'numToStr/Comment.nvim',
    'lewis6991/gitsigns.nvim',
    'mg979/vim-visual-multi',
    'mbbill/undotree',

    -- formatting
    'godlygeek/tabular',

    -- productivity
    'preservim/vim-markdown',
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    'lervag/lists.vim',
    'jghauser/follow-md-links.nvim',

    -- searching
    'mhinz/vim-grepper',
    'junegunn/fzf.vim',

    -- tpope section
    'tpope/vim-dispatch',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-rails',
    'tpope/vim-surround',
    'tpope/vim-vinegar',
    'tpope/vim-rhubarb',
    'tpope/vim-characterize',
    'tpope/vim-unimpaired',

    -- colours/highlighting
    'dracula/vim',
    { 'rrethy/vim-hexokinase', build = 'make hexokinase' },

    -- language specific
    'vim-crystal/vim-crystal',

    -- lsp and snippet stuff
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'j-hui/fidget.nvim',
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-emoji',
        'petertriho/cmp-git',
        'saadparwaiz1/cmp_luasnip',
        'peteryates/friendly-snippets',
        'L3MON4D3/LuaSnip',
        { url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
      },
    },

    -- lsp sources
    'MunifTanjim/prettier.nvim',
    'elbywan/crystalline',

    -- treesitter
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      dependencies = {
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-treesitter-context',
        'HiPhish/nvim-ts-rainbow2',
        'Wansmer/treesj',
      },
    },
  }
)
