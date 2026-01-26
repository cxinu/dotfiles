-- Windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close window" })

-- Scroll and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Manipulate lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines preserving cursor" })
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Clipboard
vim.keymap.set({ "n", "x", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "x", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Diagnostics & Quickfix
local function toggle_diagnostics_qf()
  local qf = vim.fn.getqflist { winid = 0 }
  if qf.winid ~= 0 then -- Quickfix is open → close it
    vim.cmd "cclose"
  else
    vim.fn.setqflist {}
    vim.diagnostic.setqflist { open = true }
  end
end

vim.keymap.set("n", "<leader>d", toggle_diagnostics_qf, { desc = "Toggle diagnostics quickfix" })
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "quickfix Next item" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "quickfix Prev item" })

-- Insert mode QoL
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, desc = "Paste from system clipboard in insert" })
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set({ "i", "c", "t" }, "<C-BS>", "<C-w>", { noremap = true, desc = "Delete previous word" })

-- Logic & Toggles
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>to", function()
  vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { desc = "Toggle cursor lock" })
vim.keymap.set("n", "<leader>tw", function()
  vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle wrap" })

-- Terminal
vim.keymap.set({ "n", "t" }, "<C-o>", function()
  require("util.terminal").toggle()
end, { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", { noremap = true, silent = true, desc = "Window up in terminal" })
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Development & Meta
vim.keymap.set("n", "<leader>X", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
vim.keymap.set("n", "<C-S-h>", function()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end, { noremap = true, silent = false })
