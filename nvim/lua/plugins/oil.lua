require('oil').setup({
  win_options = {
    signcolumn = 'yes:2',
  },
  view_options = {
    show_hidden = false,
  },
  columns = {
    'icon',
    'permissions',
    'size',
    'mtime',
  },
})
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
