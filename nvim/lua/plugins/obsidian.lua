return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    cmd = { "ObsidianOpen", "ObsidianQuickSwitch", "ObsidianSearch", "ObsidianSearchLink", "ObsidianSearchTag" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "wiki",
                path = "~/vaults/wiki",
            },
        },
        complitions = {
            nvim_cmp = true,
            min_chars = 0,
        },

        -- functions

        note_id_func = function(title) return title:lower():gsub(" ", "-") end,
        follow_url_func = function(url) vim.ui.open(url) end,

        -- NOTE: image support is not that great yet
        --
        -- follow_img_func = function(img)
        --     local img_path = vim.fn.getcwd() .. "/" .. img
        --     print("Opening image: " .. img_path)
        --     vim.fn.jobstart({ "xdg-open", img_path }) -- linux
        --     -- vim.ui.open(img_path)
        -- end,

        ui = {
            bullets = { char = "◉", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianImportant = { bold = true, fg = "#eed202" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { fg = "#1c1c1c", bg = "#b581fe" },
            },
        },
    },

    config = function(_, opts)
        require("obsidian").setup(opts)
        vim.wo.conceallevel = 2

        local toggle_conceal = function()
            local current_conceal = vim.wo.conceallevel
            if current_conceal == 0 then
                vim.wo.conceallevel = 2
            else
                vim.wo.conceallevel = 0
            end
        end

        -- BUG: shi doesn't work rn
        -- TODO: make highlight, bold, italic, underline, strikethrough, and code work
        --
        -- local highlight_text = function()
        --     if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
        --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
        --         vim.defer_fn(function() vim.api.nvim_feedkeys("gzaiw==", "n", false) end, 10)
        --     else
        --         vim.api.nvim_feedkeys("ysiw==", "n", false)
        --     end
        -- end

        -- remaps
        vim.keymap.set({ "n", "i", "v", "x" }, "<C-e>", toggle_conceal, { noremap = true, silent = true })
    end,
}
