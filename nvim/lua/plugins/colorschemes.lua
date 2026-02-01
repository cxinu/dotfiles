local pywal = {
  "uZer/pywal16.nvim",
}

local naysayer = {
  "whizikxd/naysayer-colors.nvim",
  -- lazy = false,
}

local glyph = {
  dir = "~/Programming/cxinu/glyph.nvim",
  name = "glyph.nvim",
  lazy = false,
  -- priority = 1000,
}

local nordic = {
  "AlexvZyl/nordic.nvim",
  -- lazy = false,
  -- priority = 1000,
  config = function()
    require("nordic").load()
  end,
}

local sonokai = {
  "sainnhe/sonokai",
  -- lazy = false,
  -- priority = 1000,
  config = function()
    -- vim.g.sonokai_style = "shusia" -- or: andromeda, atlantis, shusia, maia, espresso
    vim.g.sonokai_better_performance = 1
  end,
}

local lackluster = {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "lackluster"
    -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}

local monoglow = {
  "wnkz/monoglow.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

return { monoglow, lackluster, sonokai, nordic, pywal, naysayer, glyph }
