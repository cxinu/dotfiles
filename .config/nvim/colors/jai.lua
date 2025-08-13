-- Define the palette
local palette = {
  bg = "#0e2018",
  fg = "#c2c7c5",
  cursor = "#c2c7c5",
  black = "#0e2018",
  red = "#f38ba8",
  green = "#a6e3a1",
  yellow = "#f9e2af",
  blue = "#A7A1A2",
  magenta = "#f5c2e7",
  cyan = "#D9D3D2",
  white = "#a6adc8",
  br_black = "#585b70",
  br_red = "#f37799",
  br_green = "#89d88b",
  br_yellow = "#ebd391",
  br_blue = "#A7A1A2",
  br_magenta = "#f2aede",
  br_cyan = "#6bd7ca",
  br_white = "#bac2de",
}

-- Helper
local set = vim.api.nvim_set_hl

-- Clear and reset
vim.cmd "highlight clear"
vim.cmd "syntax reset"
vim.o.background = "dark"
vim.g.colors_name = "gaystation"

-- Core UI
set(0, "Normal", { fg = palette.fg, bg = palette.bg })
set(0, "Cursor", { fg = palette.bg, bg = palette.cursor })
set(0, "CursorLine", { bg = palette.br_black })
set(0, "CursorColumn", { bg = palette.br_black })
set(0, "Visual", { bg = palette.br_black })
set(0, "LineNr", { fg = palette.br_black })
set(0, "CursorLineNr", { fg = palette.fg })
set(0, "VertSplit", { fg = palette.br_red })
set(0, "WinSeparator", { fg = palette.br_blue })
set(0, "StatusLine", { fg = palette.fg, bg = palette.black })
set(0, "Pmenu", { fg = palette.fg, bg = palette.br_black })
set(0, "PmenuMatch", { fg = palette.br_white, bg = palette.br_black })
set(0, "PmenuSel", { fg = palette.bg, bg = palette.green })
set(0, "NormalFloat", { fg = palette.fg, bg = palette.black })
set(0, "Directory", { fg = palette.blue })

-- Syntax Highlighting
set(0, "Comment", { fg = palette.br_black, italic = true })
set(0, "Constant", { fg = palette.cyan })
set(0, "String", { fg = palette.green })
set(0, "Character", { fg = palette.green })
set(0, "Number", { fg = palette.yellow })
set(0, "Boolean", { fg = palette.red })
set(0, "Identifier", { fg = palette.fg })
set(0, "Function", { fg = palette.blue })
set(0, "Statement", { fg = palette.magenta })
set(0, "Keyword", { fg = palette.red, bold = true })
set(0, "Conditional", { fg = palette.magenta })
set(0, "Repeat", { fg = palette.magenta })
set(0, "Operator", { fg = palette.cyan })
set(0, "PreProc", { fg = palette.yellow })
set(0, "Type", { fg = palette.br_cyan })
set(0, "Special", { fg = palette.br_magenta })

-- Diffs
set(0, "DiffAdd", { bg = "#103220" })
set(0, "DiffChange", { bg = "#3b3f2f" })
set(0, "DiffDelete", { bg = "#321018" })
set(0, "DiffText", { bg = "#504320" })

-- Diagnostics
set(0, "Error", { fg = palette.red, bold = true })
set(0, "WarningMsg", { fg = palette.yellow })
set(0, "Info", { fg = palette.cyan })
set(0, "Hint", { fg = palette.br_cyan })

-- Treesitter (optional)
set(0, "@function", { fg = palette.blue })
set(0, "@keyword", { fg = palette.br_white, bold = true })
set(0, "@type", { fg = palette.br_cyan })
set(0, "@string", { fg = palette.green })
set(0, "@comment", { fg = palette.br_black, italic = true })

return palette
