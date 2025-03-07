vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.laststatus = 3
vim.opt.matchtime = 2
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showcmd = false
vim.opt.showtabline = 0
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.tags = '.tags'
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.virtualedit = 'none'
vim.opt.mouse = ''
vim.opt.conceallevel = 3
vim.opt.foldlevel = 5
vim.opt.cursorline = true
vim.opt.smartindent = true

-- search
vim.opt.hls = true
vim.opt.showmatch = true
vim.opt.grepprg="ag --vimgrep"

-- backup and swap
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- list chars
vim.opt.list = true
vim.opt.listchars = {eol = '↲', extends = '→', precedes = '←', trail = '·', tab = '»··', multispace = '·'}

vim.opt.formatoptions = 'ntcroq2p'
