require("colors")
require("plugins")

-- options
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmode = false

-- keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "-", ":Explore<CR>", { silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { silent = true })

vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append line below" })
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true })
