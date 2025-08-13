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

return { tokyonight, pywal, catpuccin, naysayer }
