-- Get the Neovim config path using NVIM_APPNAME
local config_path = vim.fn.stdpath("data")
vim.opt.rtp:append(config_path .. "/plugins/mini.nvim")


require("mini.ai").setup({ n_lines = 500 }) -- ??
require("mini.surround").setup()
-- local statusline = require("mini.statusline")
-- statusline.setup({ use_icons = vim.g.have_nerd_font })
-- statusline.section_location = function() return "%2l:%-2v" end
