return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "cpp", "lua", "typescript", "go", "html", "zig", "dockerfile" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = {
                    enable = true,
                    disable = { "zig" },
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    },
}
