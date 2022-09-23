vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.sql", "*.rb", "*.md" },
  command = [[%s/\s\+$//e]],
})
