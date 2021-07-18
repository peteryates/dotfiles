" ale
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_change_sign_column_color = 1
let g:ale_disable_lsp = 1

let g:ale_linters = {
      \ 'scss': ['stylelint'],
      \ 'ruby': ['rubocop'], 'eruby': ['erubylint'],
      \ 'markdown': ['markdownlint'],
      \ }
let g:ale_fixers = {'scss': ['stylelint'], 'ruby': ['rubocop']}

nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
