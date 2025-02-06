return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        transparent_background = true,
        term_colors = true,
        -- no_italic = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
        },
        -- Custom color palette
        color_overrides = {
            all = {
                base = "#282c34",
                mantle = "#353b45",
                surface0 = "#3e4451",
                surface1 = "#545862",
                surface2 = "#565c64",
                text = "#abb2bf",
                rosewater = "#b6bdca",
                lavender = "#c8ccd4",
                red = "#e06c75",
                peach = "#e06c99",
                yellow = "#e5c07b",
                green = "#98c379",
                teal = "#56b6c2",
                blue = "#61afef",
                mauve = "#c678dd",
                flamingo = "#FF69B4",
                maroon = "#e06c75",
                sky = "#d19a66",
                pink = "#F5C2E7",
                sapphire = "#74C7EC",
                subtext1 = "#BAC2DE",
                subtext0 = "#A6ADC8",
                overlay2 = "#9399B2",
                overlay1 = "#7F849C",
                overlay0 = "#6C7086",
                crust = "#11111B",
            },
        },
        custom_highlights = function(colors) -- Customize highlight groups for vibrancy
            return {
                Normal = { fg = "#FFFFFF", bg = colors.none },
                Comment = { fg = "#545c7e", italic = true },
                Keyword = { fg = "#4fd6be" },
                Function = { fg = "#ff9e64"},
                String = { fg = "#c3e88d" },
                Integer = { fg = "#d19a66" },
                Identifier = { fg = "#FF69B4" },
                Constant = { fg = "#FF1493", bold = true },
                Type = { fg = "#00BFFF", bold = true },
                -- Add more customizations as needed
            }
        end,
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
