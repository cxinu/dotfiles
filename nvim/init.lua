require('options')
require('keymaps')
require('autocmds')

vim.cmd('packadd! nohlsearch')

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-mini/mini.completion',
  'https://github.com/nvim-mini/mini.pairs',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  'https://github.com/stevearc/quicker.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/mbbill/undotree',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/vyfor/cord.nvim',
  'https://github.com/wakatime/vim-wakatime',
  -- dependency
  'https://github.com/nvim-tree/nvim-web-devicons',
})

vim.cmd('colorscheme mini')

require('plugins.lsp')
require('plugins.oil')
require('plugins.lualine')
require('plugins.fzf')
require('plugins.conform')

require('mini.completion').setup()
require('mini.pairs').setup()
require('quicker').setup()
require('gitsigns').setup()
require('todo-comments').setup()
require('mason').setup()
