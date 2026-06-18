vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<leader>c', '<cmd>q<CR>', { desc = 'Close window' })

vim.keymap.set({ 'n', 'x', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({ 'n', 'x', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half-page down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half-page up and center' })
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

local qf_utils = require('utils.qf')
vim.keymap.set('n', '<leader>q', qf_utils.toggle_qf, { desc = 'Toggle [Q]uickfix List' })
vim.keymap.set('n', '<leader>d', qf_utils.toggle_diagnostics, { desc = 'Toggle Diagnostics Quickfix' })
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Quickfix Next item' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'Quickfix Prev item' })

vim.keymap.set({ 'i', 'c', 't' }, '<C-BS>', '<C-w>', { noremap = true, desc = 'Delete previous word' })

vim.keymap.set('n', '<leader>tw', function() vim.o.wrap = not vim.o.wrap end, { desc = 'Toggle wrap' })

vim.keymap.set({ 'n', 't' }, '<c-y>', function() require('utils.terminal').toggle() end, { desc = 'Toggle terminal' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { noremap = true, silent = true, desc = 'Window up in terminal' })
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })

-- PLUGIN KEYMAPS
vim.keymap.set('n', '<leader>tu', '<cmd>UndotreeToggle<cr>', { desc = 'Toggle UndoTree' })
