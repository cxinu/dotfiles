return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {
            style = "night",
            transparent = true,
            styles = {
                comments = { italic = false },
            },
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },
}
