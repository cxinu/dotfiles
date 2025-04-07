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
    end,
}

local tokyonightStyles = { comments = { italic = false } }
local tokyonightOpts = {
    style = "night",
    transparent = true,
    styles = tokyonightStyles,
    on_highlights = function(hl, c)
        -- Make completion menu transparent
        hl.Pmenu = { bg = c.none }
        hl.PmenuSel = { bg = c.dark3 }
        hl.PmenuSbar = { bg = c.none }
        hl.PmenuThumb = { bg = c.dark3 }

        -- Make Telescope transparent
        hl.TelescopeNormal = { bg = c.none }
        hl.TelescopeBorder = { bg = c.none, fg = c.dark3 }
        hl.TelescopePromptNormal = { bg = c.none }
        hl.TelescopePromptBorder = { bg = c.none, fg = c.dark3 }

        -- Make other float windows transparent
        -- hl.NormalFloat = { bg = c.none }
        -- hl.FloatBorder = { bg = c.none, fg = c.dark3 }
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

local pywal = {
    'uZer/pywal16.nvim',
    config = function()
        vim.cmd.colorscheme("tokyonight")
    end,
}

return { onedark, tokyonight, pywal }
