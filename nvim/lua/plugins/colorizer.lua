return {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
        require("colorizer").setup({
            "*", -- Apply colorizer to all file types
            css = { rgb_fn = true }, -- Enable parsing of rgb(...) functions in CSS
        })
    end,
    lazy = true,
}
