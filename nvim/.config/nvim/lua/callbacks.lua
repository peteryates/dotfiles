vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.sql", "*.rb", "*.md" },
  callback = function()
    vim.schedule(function()
      vim.cmd(":StripTrailingWhitespace")
    end)
  end,
})
