vim.g.mapleader        = " "
vim.g.have_nerd_font   = true

-- Appearance
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
vim.opt.cursorline     = true
vim.opt.cursorlineopt  = "number"
vim.opt.signcolumn     = "yes"
vim.opt.fillchars      = "eob: "
vim.opt.list           = true
vim.opt.listchars      = "tab:  ,trail:·,nbsp:␣"

-- Indentation
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true
vim.opt.breakindent    = true

-- Splits and Scrolling
vim.opt.linebreak      = true
vim.opt.scrolloff      = 8
vim.opt.splitright     = true
vim.opt.splitbelow     = true

-- Files
vim.opt.swapfile       = false
vim.opt.undofile       = true

-- Search and Performance
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.updatetime     = 50
vim.opt.timeoutlen     = 300

-- UI
vim.opt.showmode       = false

-- Neovide
if vim.g.neovide then
  vim.g.neovide_animation = true
  vim.g.neovide_fullscreen = false

  -- disable animations
  if not vim.g.neovide_animation then
    vim.g.neovide_position_animation_length     = 1
    vim.g.neovide_cursor_animation_length       = 0.01
    vim.g.neovide_cursor_trail_size             = 1
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line   = true
    vim.g.neovide_scroll_animation_far_lines    = 0
    vim.g.neovide_scroll_animation_length       = 0.01
  end

  vim.g.terminal_color_0  = "#1d1f21" -- black
  vim.g.terminal_color_1  = "#cc6666" -- red
  vim.g.terminal_color_2  = "#b5bd68" -- green
  vim.g.terminal_color_3  = "#f0c674" -- yellow
  vim.g.terminal_color_4  = "#81a2be" -- blue
  vim.g.terminal_color_5  = "#b294bb" -- magenta
  vim.g.terminal_color_6  = "#8abeb7" -- cyan
  vim.g.terminal_color_7  = "#c5c8c6" -- white
  vim.g.terminal_color_8  = "#666666" -- bright black
  vim.g.terminal_color_9  = "#d54e53" -- bright red
  vim.g.terminal_color_10 = "#b9ca4a" -- bright green
  vim.g.terminal_color_11 = "#e7c547" -- bright yellow
  vim.g.terminal_color_12 = "#7aa6da" -- bright blue
  vim.g.terminal_color_13 = "#c397d8" -- bright magenta
  vim.g.terminal_color_14 = "#70c0b1" -- bright cyan
  vim.g.terminal_color_15 = "#eaeaea" -- bright white
end
