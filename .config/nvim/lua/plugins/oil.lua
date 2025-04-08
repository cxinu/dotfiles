local oil_nvim = {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            win_options = {
                signcolumn = "yes:2",
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}

local oil_git_status = {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim" },
    config = true,
}

return { oil_nvim, oil_git_status }
