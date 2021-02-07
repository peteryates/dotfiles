" load fzf before anything else
:so /usr/share/nvim/site/plugin/fzf.vim

call plug#begin('~/.cache/nvim')
" general
	Plug 'Yggdroot/indentLine'
	Plug 'dense-analysis/ale'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'godlygeek/tabular'
	Plug 'iamcco/markdown-preview.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'mg979/vim-visual-multi'
	Plug 'mhinz/vim-grepper'
	Plug 'neoclide/coc.nvim'
	Plug 'plasticboy/vim-markdown'
	Plug 'slim-template/vim-slim'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" tpope section
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-dadbod'
	Plug 'tpope/vim-dispatch'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rails'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-vinegar'

" colours
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-airline/vim-airline'
	Plug 'baeuml/summerfruit256.vim'
	Plug 'morhetz/gruvbox'

call plug#end()

set t_Co=256
set shiftwidth=4
set tabstop=4
set expandtab
set nowrap
set nohls
set nolist
set hidden
set listchars=tab:→\ ,trail:·,precedes:←,extends:→
set tags=\.tags;
set colorcolumn=100
set termguicolors

set splitbelow
set splitright

set laststatus=2
set showtabline=0
set guioptions-=e
set conceallevel=0

" colours
colorscheme gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
set bg=light


" ale
let g:ale_linters = {'scss': ['stylelint'], 'ruby': ['rubocop'], 'eruby': ['erubylint']}
let g:ale_fixers = {'scss': ['stylelint'], 'ruby': ['rubocop']}

" search mappings
set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
nnoremap <leader>G :Grepper -tool ag<cr>

" coc vim
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" markdown
let g:vim_markdown_fenced_languages = ['ruby=ruby', 'sql=sql']
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0

" dadbod
let g:db   = "postgresql:///peter"
let g:gias = "postgresql:///gias"

" pgsql
let g:sql_type_default = 'pgsql'

" fzf mappings
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>T :Tags<CR>

" indentline
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" filetyle-specific settings
:autocmd Filetype ruby set softtabstop=2 shiftwidth=2 tabstop=2

:autocmd Filetype cucumber set softtabstop=4 shiftwidth=4 tabstop=4

:autocmd Filetype yaml set softtabstop=2 shiftwidth=2 tabstop=2

:autocmd Filetype slim set softtabstop=2 shiftwidth=2 tabstop=2

:autocmd Filetype scss set softtabstop=2 shiftwidth=2 tabstop=2
:autocmd Filetype sass set softtabstop=2 shiftwidth=2 tabstop=2

:autocmd Filetype javascript set softtabstop=2 shiftwidth=2 tabstop=2

:autocmd Filetype markdown set softtabstop=2 shiftwidth=2 tabstop=2 textwidth=0 wrapmargin=0 foldlevel=3 wrap linebreak nolist

:autocmd Filetype jinja.html set tabstop=2 softtabstop=2 shiftwidth=2 tabstop=2

:autocmd Filetype sql set noexpandtab softtabstop=4 shiftwidth=4 tabstop=4 list

:autocmd Filetype gitcommit set colorcolumn=50,72


" wildignore
set wildignore+=**/node_modules
set wildignore+=**/logs
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.woff,*.woff2
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/app/assets/*,*/tmp/cache/*
set wildignore+=*/tmp/*
set wildignore+=**.swp,*~,._*
