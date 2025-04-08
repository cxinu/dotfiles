return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        indent = {
            char = "┃",
            tab_char = "┃",
            highlight = "IblNormal",
        },
        scope = {
            show_start = false,
            show_end = false,
            highlight = "IblScope",
        },
    },
    main = "ibl",
    config = function(_, opts)
        require("ibl").setup(opts)
        -- vim.cmd("IBLDisable")
        -- vim.cmd("IBLDisableScope")
    end,
}
