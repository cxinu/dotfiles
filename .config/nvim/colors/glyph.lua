local palette = {
  -- Core colors
  bg         = "#0e2018", -- Background (dark teal)
  fg         = "#c2c7c5", -- Foreground (light gray)
  cursor     = "#c2c7c5", -- Cursor (matches fg)

  black      = "#0e2018", -- Black (matches bg)
  br_black   = "#585b70", -- Bright black (dark gray)
  red        = "#f38ba8", -- Soft red
  br_red     = "#f37799", -- Bright red
  yellow     = "#f9e2af", -- Warm yellow
  br_yellow  = "#ebd391", -- Bright yellow
  blue       = "#a7a1a2", -- Muted blue-gray
  br_blue    = "#aaaaaa", -- Bright blue (matches blue)
  magenta    = "#f5c2e7", -- Pastel magenta
  br_magenta = "#f2aede", -- Bright magenta
  cyan       = "#6bd3d2", -- Light gray-cyan
  br_cyan    = "#6bd7ca", -- Bright cyan
  green      = "#a6e3a1", -- Light green
  br_green   = "#89d88b", -- Bright green
  white      = "#a6adc8", -- Soft white-blue
  br_white   = "#bac2de", -- Bright white

  -- Extended colors
  bg_alt     = "#1a2f25", -- Secondary background (e.g., statusline)
  fg_alt     = "#d8dedb", -- Brighter foreground (emphasis)
  gray       = "#3b4252", -- Neutral gray (inactive UI)
  br_gray    = "#6c7086", -- Bright gray (hover/highlight)
  orange     = "#f5a97f", -- Warm orange (warnings)
  br_orange  = "#f4b261", -- Bright orange (diagnostics)
  purple     = "#c6a0f6", -- Soft purple (annotations)
  br_purple  = "#b7a1e6", -- Bright purple (highlighted)
  teal       = "#4ec9b0", -- Vibrant teal (accents)
  br_teal    = "#45b7a0", -- Bright teal (contrast)
  pink       = "#f4b8e4", -- Bright pink (standout)
  br_pink    = "#e8a2d4", -- Softer bright pink (selection)
  olive      = "#98c379", -- Muted olive green (strings)
  br_olive   = "#87b368", -- Bright olive (contrast)
}

local set_hl = vim.api.nvim_set_hl

vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background    = "dark"
vim.g.colors_name   = "glyph"

palette.diff_add    = "#103220"
palette.diff_change = "#3b3f2f"
palette.diff_delete = "#321018"
palette.diff_text   = "#504320"

local highlights    = {
  -- Core UI
  Normal        = { fg = palette.fg, bg = palette.bg },
  Cursor        = { fg = palette.bg, bg = palette.olive },
  CursorLine    = { bg = palette.br_black },
  CursorColumn  = { bg = palette.br_black },
  Visual        = { bg = palette.gray },
  LineNr        = { fg = palette.br_black },
  CursorLineNr  = { fg = palette.fg },
  VertSplit     = { fg = palette.br_red },
  WinSeparator  = { fg = palette.br_blue },
  StatusLine    = { fg = palette.fg, bg = palette.black },
  Pmenu         = { fg = palette.fg, bg = palette.br_black },
  PmenuMatch    = { fg = palette.br_white, bg = palette.br_black },
  PmenuSel      = { fg = palette.bg, bg = palette.green },
  NormalFloat   = { fg = palette.fg, bg = palette.black },
  Directory     = { fg = palette.blue },

  -- Syntax Highlighting
  Comment       = { fg = palette.br_black, italic = true },
  Constant      = { fg = palette.cyan },
  String        = { fg = palette.green },
  Character     = { fg = palette.green },
  Number        = { fg = palette.yellow },
  Boolean       = { fg = palette.red },
  Identifier    = { fg = palette.fg },
  Function      = { fg = palette.blue },
  Statement     = { fg = palette.magenta },
  Keyword       = { fg = palette.red, bold = true },
  Conditional   = { fg = palette.magenta },
  Repeat        = { fg = palette.magenta },
  Operator      = { fg = palette.cyan },
  PreProc       = { fg = palette.yellow },
  Type          = { fg = palette.br_cyan },
  Special       = { fg = palette.br_magenta },

  -- Diffs
  DiffAdd       = { bg = palette.diff_add },
  DiffChange    = { bg = palette.diff_change },
  DiffDelete    = { bg = palette.diff_delete },
  DiffText      = { bg = palette.diff_text },

  -- Diagnostics
  Error         = { fg = palette.red, bold = true },
  WarningMsg    = { fg = palette.yellow },
  Info          = { fg = palette.cyan },
  Hint          = { fg = palette.br_cyan },

  -- Treesitter
  ["@function"] = { fg = palette.purple },
  ["@keyword"]  = { fg = palette.red, bold = true },
  ["@type"]     = { fg = palette.br_cyan },
  ["@string"]   = { fg = palette.green },
  ["@comment"]  = { fg = palette.br_black, italic = true },
  ["@constant"] = { fg = palette.orange, bold = true },
}

for group, opts in pairs(highlights) do
  set_hl(0, group, opts)
end

return palette
