-----------------------------------------------------------
-- General & Leader Settings
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.have_nerd_font = true

-----------------------------------------------------------
-- UI & Display Settings
-----------------------------------------------------------
vim.opt.number = true             -- Show absolute line numbers
vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors
vim.opt.cursorline = true         -- Highlight the current line
vim.opt.cursorlineopt = "number"  -- Highlight line number instead of full line
vim.opt.signcolumn = "yes"        -- Always show the sign column
vim.opt.fillchars = { eob = " " } -- Hide the ~ on empty lines

-----------------------------------------------------------
-- Whitespace & List Characters
-----------------------------------------------------------
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-----------------------------------------------------------
-- Indentation & Tab Settings
-----------------------------------------------------------
vim.opt.tabstop = 4        -- Number of spaces tabs count for
vim.opt.softtabstop = 4    -- Number of spaces per tab while editing
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
-- vim.opt.autoindent = true           -- (Optional) Enable auto-indent
vim.opt.smartindent = true -- Automatically insert indents in some cases
vim.opt.breakindent = true -- Wrapped lines continue visually indented

-----------------------------------------------------------
-- Wrapping, Scrolling, & Splitting
-----------------------------------------------------------
vim.opt.linebreak = true  -- Wrap lines at convenient points
vim.opt.scrolloff = 8     -- Minimal number of screen lines to keep above and below the cursor
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-----------------------------------------------------------
-- File, Backup & Undo Settings
-----------------------------------------------------------
vim.opt.swapfile = false -- Disable swap files
vim.opt.undofile = true  -- Enable persistent undo

-----------------------------------------------------------
-- Search & Performance Settings
-----------------------------------------------------------
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smartcase = true  -- Override ignorecase if search contains uppercase
vim.opt.updatetime = 50   -- Faster completion (default is 4000ms)
vim.opt.timeoutlen = 300  -- Time to wait for a mapped sequence to complete

-----------------------------------------------------------
-- Other Settings
-----------------------------------------------------------
vim.opt.showmode = false -- We use a statusline, so no need for the default mode display

