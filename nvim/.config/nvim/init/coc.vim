" coc vim
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <c-j> <Plug>(coc-snippets-select)
imap <c-j> <Plug>(coc-snippets-expand-jump)
