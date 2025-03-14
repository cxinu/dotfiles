return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        indent = {
            char = "|",
            tab_char = "|",
            highlight = "CustomIndentDarkGrey",
        },
        scope = { show_start = false, show_end = false },
    },
    main = "ibl",
    config = function(_, opts)
        require("ibl").setup(opts)
        -- vim.cmd("IBLDisable")
        -- vim.cmd("IBLDisableScope")
    end,
}
