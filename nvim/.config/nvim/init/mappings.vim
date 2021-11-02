map <F2> :Rename 

nnoremap <silent>gD     <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gr     <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>K      <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><A-k>  <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><A-j>  <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent><A-r>  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><A-c>  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><A-n>  <cmd>:cnext<CR>
nnoremap <silent><A-p>  <cmd>:cprev<CR>
