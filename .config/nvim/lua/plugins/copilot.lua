local copilot = {
    "github/copilot.vim",
    -- event = "InsertEnter",
    cmd = 'Copilot',
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set("i", "<C-a>", 'copilot#Accept("<CR>")',
            { noremap = true, silent = true, expr = true, replace_keycodes = false })
    end,
}

-- TODO: connect copilot-cmp with blink.cmp
local copilot_cmp = {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function() require("copilot_cmp").setup() end,
    dependencies = {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
}

return { copilot }
