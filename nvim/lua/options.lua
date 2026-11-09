vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.breakindent = true
vim.o.linebreak = true

vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.fillchars = 'eob: '
vim.o.scrolloff = 10
vim.o.list = true
vim.o.listchars = 'tab:  ,trail:·,'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.confirm = true
vim.o.swapfile = false
vim.o.undofile = true

vim.o.winborder = 'rounded'

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})
