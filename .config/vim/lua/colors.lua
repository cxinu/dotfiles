-- git clone --depth=1 <theme-git> ~/.config/nvim/colors/<theme-name>
-- Get the Neovim config path using NVIM_APPNAME
local config_path = vim.fn.stdpath("data")
local themes = {
    "catppuccin",
    "rose-pine",
    "tokyonight",
    "gruvbox",
    "kanagawa",
    "onedark",
}

for _, theme in ipairs(themes) do
    vim.opt.rtp:append(config_path .. "/colors/" .. theme)
end

require('kanagawa').setup({
    theme = "dragon",      -- Load "wave" theme when 'background' option is not set
    transparent = true,    -- do not set background color
    dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
})

require('onedark').setup({
    transparent = true,
    term_color = false,
})

vim.cmd("colorscheme onedark")
