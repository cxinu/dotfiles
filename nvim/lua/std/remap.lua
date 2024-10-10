vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system Clipboard" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append line below" })

-- Toggles
vim.keymap.set("n", "<leader>to", function() vim.opt.scrolloff = 999 - vim.o.scrolloff end, { desc = "Toggle Cursor lock" })
vim.keymap.set("n", "<leader>ti", vim.cmd.IBLToggle, { desc = "Toggle Indent Blankline" })
vim.keymap.set("n", "<leader>ts", vim.cmd.IBLToggleScope, { desc = "Toggle Scope Indent Blankline" })
vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
vim.keymap.set("n", "<leader>tw", function() vim.o.wrap = not vim.o.wrap end, { desc = "Toggle Wrap" })

-- diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open diagnostics float" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Goto previous diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Goto next diagnostic" })
