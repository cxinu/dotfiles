return {
    "boganworld/crackboard.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("crackboard").setup({
            session_key = "763ff35610cd272e9ede37b1b563db6e3372feb32381daf0929cec0df30f0a1b",
        })
    end,
}
