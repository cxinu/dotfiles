require "cxinu.set"
require "cxinu.remap"
require "cxinu.autocmd"
require "cxinu.usercmd"
require "cxinu.lazy"

vim.diagnostic.config {
  virtual_lines = {
    current_line = true,
  },
}

vim.deprecate = function() end
vim.cmd.colorscheme "tokyonight"
