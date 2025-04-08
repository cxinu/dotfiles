local copilot = {
    "github/copilot.vim",
    event = "InsertEnter",
    ft = { "markdown", "text" },
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set("i", "<C-a>", 'copilot#Accept("<CR>")',
            { noremap = true, silent = true, expr = true, replace_keycodes = false })
        vim.cmd("Copilot disable")

        -- Global flag and toggle keymap
        vim.g.copilot_enabled = false
        vim.keymap.set('n', '<leader>tc', function()
            if vim.g.copilot_enabled then
                vim.cmd("Copilot disable")
                vim.g.copilot_enabled = false
                print("Copilot disabled")
            else
                vim.cmd("Copilot enable")
                vim.g.copilot_enabled = true
                print("Copilot enabled")
            end
        end, { desc = "Toggle Copilot", noremap = true, silent = true })
    end,
}

return { copilot }
