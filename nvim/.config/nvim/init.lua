vim.cmd('so /usr/share/nvim/site/plugin/fzf.vim')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
  vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end

vim.opt.rtp:prepend(lazypath)

require("options")
require("plugins")
require("wiki")
require("tmux")
