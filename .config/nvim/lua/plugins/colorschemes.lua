local oneDarkHighlights = {
    NormalFloat                = { bg = "none" },
    FloatBorder                = { bg = "none" },
    Pmenu                      = { bg = "none" },
    DiagnosticError            = { fg = "#ff5555", bold = true },
    DiagnosticWarn             = { fg = "#fdfd96", bold = true },
    DiagnosticInfo             = { fg = "#8be9fd", bold = true },
    DiagnosticHint             = { fg = "#bd93f9", bold = true },
    DiagnosticVirtualTextError = { fg = "#ff6b6b", bg = "none", bold = true },
    DiagnosticVirtualTextWarn  = { fg = "#fad7a0", bg = "none", bold = true },
    DiagnosticVirtualTextInfo  = { fg = "#77DD77", bg = "none", bold = true },
    DiagnosticVirtualTextHint  = { fg = "#bd93f9", bg = "none", bold = true },
    DiagnosticUnderlineError   = { sp = "#ff5555" },
    DiagnosticUnderlineWarn    = { sp = "#e1ffac" },
    DiagnosticUnderlineInfo    = { sp = "#8be9fd" },
    DiagnosticUnderlineHint    = { sp = "#bd93f9" },
}

local oneDarkOpts = {
    transparent = true,
    highlights = oneDarkHighlights,
}

local onedark = {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup(oneDarkOpts)
        vim.cmd("colorscheme onedark")
    end,
}

local tokyonightStyles = { comments = { italic = false } }
local tokyonightOpts = {
    style = "night",
    transparent = true,
    styles = tokyonightStyles,
}

local tokyonight = {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    opts = tokyonightOpts,
    config = function(_, opts)
        require("tokyonight").setup(opts)
    end,
}

return { onedark, tokyonight }
