vim.diagnostic.config(
  {
    virtual_text = false,
    virtual_lines = false,
    float = {
      focusable = false,
      border = 'rounded'
    },
    signs = false,
  }
)

vim.keymap.set({ "n", "v", "i" }, "<Leader>e",
  function()
    vim.diagnostic.open_float({ scope = 'line' })
  end,
  { silent = true, desc = "Fuzzy find files" })
