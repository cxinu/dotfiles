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

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  command = "silent! write",
})

vim.cmd "colorscheme mini"
