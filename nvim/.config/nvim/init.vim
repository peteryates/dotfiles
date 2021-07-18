" load fzf before anything else
:so /usr/share/nvim/site/plugin/fzf.vim

call plug#begin('~/.cache/nvim')
  " general
  Plug 'Yggdroot/indentLine'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'iamcco/markdown-preview.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mg979/vim-visual-multi'
  Plug 'mhinz/vim-grepper'
  Plug 'plasticboy/vim-markdown'
  Plug 'slim-template/vim-slim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'mhinz/vim-signify'
  Plug 'honza/vim-snippets'
  Plug 'andymass/vim-matchup'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'kshenoy/vim-signature'

  " tpope section
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-rhubarb'

  " colours
  Plug 'itchyny/lightline.vim'
  Plug 'baeuml/summerfruit256.vim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'

  " lsp stuff
  Plug 'hrsh7th/nvim-compe'
  Plug 'neovim/nvim-lspconfig'

  " requires nightly
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/playground'
  Plug 'p00f/nvim-ts-rainbow'
call plug#end()

set t_Co=256
set expandtab
set nowrap
set nohls
set nolist
set hidden
set listchars=tab:→\ ,trail:·,precedes:←,extends:→
set tags=\.tags;
set colorcolumn=100
set termguicolors
set showmatch
set matchtime=2
set completeopt=menuone,noselect

set splitbelow
set splitright

set laststatus=2
set showtabline=0
set guioptions-=e
set conceallevel=0
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noshowcmd
set number relativenumber

set nobackup
set nowritebackup
set noswapfile

source <sfile>:h/init/filetype.vim
source <sfile>:h/init/functions.vim
source <sfile>:h/init/fzf.vim
source <sfile>:h/init/grepper.vim
source <sfile>:h/init/hexokinase.vim
source <sfile>:h/init/indentline.vim
source <sfile>:h/init/lightline.vim
source <sfile>:h/init/mappings.vim
source <sfile>:h/init/markdown.vim
source <sfile>:h/init/signify.vim
source <sfile>:h/init/nord.vim
source <sfile>:h/init/treesitter.vim
source <sfile>:h/init/tmux.vim
source <sfile>:h/init/wildignore.vim

luafile <sfile>:h/init/compe.lua
luafile <sfile>:h/init/lspconfig.lua
