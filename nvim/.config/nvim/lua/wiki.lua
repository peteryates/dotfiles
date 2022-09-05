local settings = {
  path = '~/docs/wiki',
  syntax = 'markdown',
  ext = '.md',
  auto_generate_tags = 1,
  auto_generate_links = 1,
  auto_diary_index = 1,
}

vim.g.vimwiki_list = {settings}
vim.g.vimwiki_listsyms = ' ox'
vim.g.vimwiki_key_mappings = { headers = 0 }
