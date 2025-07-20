return {
  {
    'ibhagwan/fzf-lua',
    config = function()
      require("fzf-lua").setup({
        'fzf-native',
        file_icons = false,
        fzf_opts =  {['--layout'] = 'default'}
      })
      vim.keymap.set({ "n", "v", "i" }, "<Leader>t",
        function() require("fzf-lua").files() end,
        { silent = true, desc = "Fuzzy find files" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>T",
        function() require("fzf-lua").live_grep() end,
        { silent = true, desc = "Live grep" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>b",
        function() require("fzf-lua").buffers() end,
        { silent = true, desc = "Fuzzy find open buffers" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>l",
        function() require("fzf-lua").blines() end,
        { silent = true, desc = "Fuzzy find lines in current buffer" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>L",
        function() require("fzf-lua").blines() end,
        { silent = true, desc = "Fuzzy find lines in all buffers" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>h",
        function() require("fzf-lua").git_bcommits() end,
        { silent = true, desc = "Fuzzy find buffer git commits" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>H",
        function() require("fzf-lua").git_commits() end,
        { silent = true, desc = "Fuzzy find project git commits" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>s",
        function() require("fzf-lua").spell_suggest() end,
        { silent = true, desc = "Suggest spellings" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>r",
        function() require("fzf-lua").lsp_references() end,
        { silent = true, desc = "Fuzzy find LSP references" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>d",
        function() require("fzf-lua").diagnostics_document() end,
        { silent = true, desc = "Fuzzy find diagnostics in buffer" })

      vim.keymap.set({ "n", "v", "i" }, "<Leader>D",
        function() require("fzf-lua").diagnostics_workspace() end,
        { silent = true, desc = "Fuzzy find workspace in project" })

      vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>",
        function() require("fzf-lua").complete_path() end,
        { silent = true, desc = "Fuzzy complete path" })
    end
  }
}
