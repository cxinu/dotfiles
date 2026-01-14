local tokyonightStyles = { comments = { italic = false } }
local tokyonightOpts = {
  style = "night",
  transparent = false,
  styles = tokyonightStyles,
  on_highlights = function(hl, c)
    -- Make completion menu transparent
    -- hl.Pmenu = { bg = c.none }
    -- hl.PmenuSel = { bg = c.dark3 }
    -- hl.PmenuSbar = { bg = c.none }
    -- hl.PmenuThumb = { bg = c.dark3 }

    -- Make Telescope transparent
    hl.TelescopeNormal = { bg = c.none }
    hl.TelescopeBorder = { bg = c.none, fg = c.dark3 }
    hl.TelescopePromptNormal = { bg = c.none }
    hl.TelescopePromptBorder = { bg = c.none, fg = c.dark3 }

    -- Make other float windows transparent
    hl.NormalFloat = { bg = c.none }
    hl.FloatBorder = { bg = c.none, fg = c.dark3 }
  end,
}

local tokyonight = {
  "folke/tokyonight.nvim",
  event = "VeryLazy",
  opts = tokyonightOpts,
  config = function(_, opts)
    require("tokyonight").setup(opts)
  end,
}

local catpuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
}

local pywal = {
  "uZer/pywal16.nvim",
}

local naysayer = {
  "whizikxd/naysayer-colors.nvim",
  lazy = false,
}

local glyph = {
  dir = "~/Programming/cxinu/glyph.nvim",
  name = "glyph.nvim",
  lazy = false,
  priority = 1000,
}

local nordic = {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').load()
  end
}

local sonokai = {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.g.sonokai_style = "shusia" -- or: andromeda, atlantis, shusia, maia, espresso
    vim.g.sonokai_better_performance = 1
  end,
}

return { sonokai, nordic, tokyonight, pywal, catpuccin, naysayer, glyph }
