require "config.options"
require "config.lazy"
require "config.keymaps"
require "config.autocmd"
require "config.usercmd"
require "config.neovide"

vim.diagnostic.config {
  underline = false,
  virtual_lines = { current_line = true },
}

-- bellow is removed
vim.cmd "highlight clear"
vim.cmd "syntax reset"

vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd "colorscheme lackluster-mint"
