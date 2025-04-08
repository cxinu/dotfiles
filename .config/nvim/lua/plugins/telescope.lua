return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
        local action_layout = require("telescope.actions.layout")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = { ["<M-p>"] = action_layout.toggle_preview, },
                },
            },
            pickers = {
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                    previewer = false,
                },
                man_pages = {
                    sections = { "1", "2", "3", "3p", "4", "5", "6", "7", "8", "9", "n", "l" }
                },
                live_grep = {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            },
        })

        pcall(require("telescope").load_extension, "fzf")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "[S]earch [B]uiltins" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>st", vim.cmd.TodoTelescope, { desc = "[S]earch [T]odos" })
        vim.keymap.set("n", "<leader>s/", builtin.live_grep, { desc = "[S]earch [/] in Open Files" })
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search buffer" })
        vim.keymap.set("n", "<leader>sn", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end,
            { desc = "[S]earch [N]eovim files" })
        vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "[S]earch [M]an Pages" })
    end,
}
