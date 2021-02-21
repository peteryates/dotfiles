" pgsql
let g:sql_type_default = 'pgsql'

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
