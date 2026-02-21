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

vim.cmd "colorscheme mini"
