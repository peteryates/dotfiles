return {
  { 'godlygeek/tabular' },
  { 'jghauser/follow-md-links.nvim' },
  {
    "gaoDean/autolist.nvim",
    ft = { "markdown" },
    config = function()
        require("autolist").setup()

        vim.keymap.set("n", "<M-c>", "<cmd>AutolistToggleCheckbox<cr>")

        vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
        vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })
    end
  },
}
