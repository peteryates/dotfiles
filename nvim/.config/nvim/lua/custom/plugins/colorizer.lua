return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
    },
    config = function()
      require("colorizer").setup({
        user_default_options = {
          mode = 'virtualtext',
          sass = { enable = false, parsers = { "css" } },
          virtualtext_inline = false,
        }
      })
    end
  }
}
