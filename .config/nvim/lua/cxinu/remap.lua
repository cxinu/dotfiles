-----------------------------------------------------------
-- Window Navigation & Cursor Movement
-----------------------------------------------------------
-- Navigate between splits and closing
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close window" })

-- Cursor centering after half-page movements & search
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Append line without moving cursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines preserving cursor" })

-----------------------------------------------------------
-- Insert Mode Shortcuts
-----------------------------------------------------------
-- Use Ctrl-c and Ctrl-[ to exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "<C-[>", "<C-c>", { noremap = true, silent = true, desc = "Alternative exit insert mode" })

-----------------------------------------------------------
-- Visual & Block Mode Editing
-----------------------------------------------------------
-- Move selected lines up or down in visual mode
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-----------------------------------------------------------
-- Clipboard & Register Management
-----------------------------------------------------------
-- Yank to system clipboard
vim.keymap.set({ "n", "x", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- Paste from system clipboard
vim.keymap.set({ "n", "x", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
-- Paste from system clipboard Insert Mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, desc = "Paste from system clipboard" })
-- Paste without yanking the replaced text (useful for maintaining your yank buffer)
vim.keymap.set({ "n", "x", "v" }, "<leader>P", '"_dP', { desc = "Paste without yank" })
-- Delete without yanking (sends to the black hole register)
vim.keymap.set({ "n", "x", "v" }, "<leader>x", '"_dd', { desc = "Delete without yank" })

-----------------------------------------------------------
-- Diagnostics
-----------------------------------------------------------
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist, { desc = "Open diagnostics list" })

-----------------------------------------------------------
-- Toggles & Utility Functions
-----------------------------------------------------------
-- Toggle cursor lock (adjust scrolloff dynamically)
vim.keymap.set("n", "<leader>to", function() vim.opt.scrolloff = 999 - vim.o.scrolloff end,
  { desc = "Toggle cursor lock" })
vim.keymap.set("n", "<leader>ti", vim.cmd.IBLToggle, { desc = "Toggle indent guides" })
vim.keymap.set("n", "<leader>ts", vim.cmd.IBLToggleScope, { desc = "Toggle scope indent" })
vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
vim.keymap.set("n", "<leader>tw", function() vim.o.wrap = not vim.o.wrap end, { desc = "Toggle wrap" })

-- Utility remaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<space>X", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-----------------------------------------------------------
-- Obsidian Integration
-----------------------------------------------------------
vim.keymap.set("n", "<leader>oo", vim.cmd.ObsidianOpen, { desc = "Open in Obsidian" })
vim.keymap.set("n", "<leader>of", vim.cmd.ObsidianSearch, { desc = "Fuzzy search in Obsidian" })
vim.keymap.set("n", "<leader>on", vim.cmd.ObsidianQuickSwitch, { desc = "Quick switch Obsidian notes" })
vim.keymap.set("n", "<leader>op", vim.cmd.ObsidianPasteImg, { desc = "Paste image in Obsidian" })

-----------------------------------------------------------
-- Terminal Integration
-----------------------------------------------------------
-- Toggle horizontal terminal window
vim.keymap.set("n", "<C-o>", ":lua ToggleHorizontalTerm()<CR>",
  { noremap = true, silent = true, desc = "Toggle terminal (normal mode)" })
vim.keymap.set("t", "<C-o>", "<C-\\><C-n>:lua ToggleHorizontalTerm()<CR>",
  { noremap = true, silent = true, desc = "Toggle terminal (terminal mode)" })

-- Terminal navigation and exit mappings
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", { noremap = true, silent = true, desc = "Window up in terminal" })
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Backspace behavior in insert mode for terminal (and other modes)
vim.keymap.set({ 'i', 'c', 't' }, '<C-BS>', '<C-w>', { noremap = true, desc = "Delete previous word" })

-----------------------------------------------------------
-- Quickfix & location-list
-----------------------------------------------------------
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "quickfix Next item" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "quickfix Prev item" })
vim.keymap.set("n", "<M-l>", "<cmd>lnext<CR>", { desc = "location-list Next item" })
vim.keymap.set("n", "<M-h>", "<cmd>lprev<CR>", { desc = "location-list Prev item" })
