return {
  "allaman/emoji.nvim",
  version = "4.0.0",
  dependencies = { "allaman/emoji.nvim", "ibhagwan/fzf-lua" },
  opts = {},
  config = function(_, opts)
    require("emoji").setup(opts)
    require("fzf-lua").register_ui_select()

    vim.api.nvim_set_keymap(
      "n",
      "<leader>e",
      ":lua require('emoji').insert()<cr>",
      { silent = true }
    )
  end,
}
