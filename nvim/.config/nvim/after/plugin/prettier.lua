-- local null_ls = require("null-ls")
local prettier = require("prettier")

-- null_ls.setup({
--   on_attach = function(client, _)
--     if client.server_capabilities.documentFormattingProvider then
--       vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
--
--       -- format on save
--       vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
--     end
--
--     if client.server_capabilities.documentRangeFormattingProvider then
--       vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_format({})<CR>")
--     end
--   end,
-- })

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "html",
    "javascript",
    "json",
    "markdown",
    "scss",
    "typescript",
    "yaml",
  },
})
