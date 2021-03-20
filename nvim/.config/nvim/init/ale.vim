" ale
let g:ale_linters = {
      \ 'scss': ['stylelint'],
      \ 'ruby': ['rubocop'], 'eruby': ['erubylint'],
      \ 'markdown': ['markdownlint'],
      \ }
let g:ale_fixers = {'scss': ['stylelint'], 'ruby': ['rubocop']}
