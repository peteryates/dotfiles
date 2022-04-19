" load fzf before anything else
:so /usr/share/nvim/site/plugin/fzf.vim

call plug#begin('~/.cache/nvim')
  " general
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/fzf.vim'
  Plug 'mg979/vim-visual-multi'
  Plug 'mhinz/vim-grepper'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'sheerun/vim-polyglot'
  Plug 'numToStr/Comment.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'stevearc/dressing.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'folke/trouble.nvim'

  " tpope section
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-characterize'

  " colours
  Plug 'itchyny/lightline.vim'
  Plug 'dracula/vim'

  " snippets
  Plug 'rafamadriz/friendly-snippets'
  Plug 'L3MON4D3/LuaSnip'

  " lsp stuff
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'williamboman/nvim-lsp-installer'

  " lsp sources
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-emoji'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'

  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/playground'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'RRethy/nvim-treesitter-endwise'
call plug#end()

set t_Co=256
set expandtab
set nowrap
set nohls
set hidden
set list
set listchars=tab:→\ ,trail:·,precedes:←,extends:→,eol:↲
set tags=\.tags;
set termguicolors
set showmatch
set matchtime=2

set splitbelow
set splitright

set laststatus=3
set showtabline=0
set guioptions-=e
set conceallevel=0
set expandtab
set shiftwidth=2
set shiftround
set softtabstop=2
set tabstop=2
set noshowcmd
set number relativenumber

set nobackup
set nowritebackup
set noswapfile

source <sfile>:h/init/colours.vim
source <sfile>:h/init/filetype.vim
source <sfile>:h/init/functions.vim
source <sfile>:h/init/fzf.vim
source <sfile>:h/init/grepper.vim
source <sfile>:h/init/hexokinase.vim
source <sfile>:h/init/lightline.vim
source <sfile>:h/init/mappings.vim
source <sfile>:h/init/markdown.vim
source <sfile>:h/init/treesitter.vim
source <sfile>:h/init/tmux.vim
source <sfile>:h/init/wildignore.vim

luafile <sfile>:h/init/lsp.lua
luafile <sfile>:h/init/lsp-installer.lua
luafile <sfile>:h/init/comment.lua
luafile <sfile>:h/init/gitsigns.lua
luafile <sfile>:h/init/trouble.lua
luafile <sfile>:h/init/prettier.lua
luafile <sfile>:h/init/snippets.lua
