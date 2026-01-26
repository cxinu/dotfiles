if not vim.g.neovide then
  return
end

-- General Config
vim.g.neovide_fullscreen = false
vim.g.neovide_cursor_animation_length = 0.13

local animations_enabled = true
if not animations_enabled then
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_scroll_animation_length = 0
end

local mint = "#789978"
local lack = "#708090"
local luster = "#deeeed"
local gray_dim = "#444444"
local gray_med = "#888888"

local zen_colors = {
  ["0"] = "#1d1f21",
  ["1"] = mint,
  ["2"] = mint,
  ["3"] = gray_med,
  ["4"] = lack,
  ["5"] = gray_med,
  ["6"] = mint,
  ["7"] = luster,
  -- Bright variants
  ["8"] = gray_dim,
  ["9"] = mint,
  ["10"] = mint,
  ["11"] = gray_med,
  ["12"] = lack,
  ["13"] = gray_med,
  ["14"] = mint,
  ["15"] = luster,
}

for i, color in pairs(zen_colors) do
  vim.g["terminal_color_" .. i] = color
end

-- Scaling Mappings
local change_scale = function(delta)
  vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) + delta
end

vim.keymap.set("n", "<C-=>", function()
  change_scale(0.1)
end, { desc = "GUI: Increase Scale" })
vim.keymap.set("n", "<C-->", function()
  change_scale(-0.1)
end, { desc = "GUI: Decrease Scale" })
vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end, { desc = "GUI: Reset Scale" })
