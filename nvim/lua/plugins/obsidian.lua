return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
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
        ---@param url string
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            -- vim.fn.jobstart({ "open", url }) -- Mac OS
            vim.fn.jobstart({ "xdg-open", url }) -- linux
            -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
            -- vim.ui.open(url) -- need Neovim 0.10.0+
        end,

        -- TODO: 1) Add image path for browser
        -- Get full path of image

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
        -- file it will be ignored but you can customize this behavior here.
        ---@param img string
        follow_img_func = function(img)
            -- pwd = vim.fn.getcwd()
            -- vim.fn.jobstart({ "qlmanage", "-p", img }) -- Mac OS quick look preview
            vim.fn.jobstart({ "xdg-open", img }) -- linux
            -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        end,
        ui = {
            -- ⦿ ○ ● ◉ ◎ ◯ ◦ ☉ ⚫ ⚪
            bullets = { char = "◉", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
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
                ObsidianHighlightText = { fg = "#1c1c1c", bg = "#bffa37" },
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

        -- BUGS: shi doesn't work rn
        -- TODO: 2) make highlight, bold, italic, underline, strikethrough, and code work
        -- TODO: 3) fix todo-comments as well
        -- local highlight_text = function()
        --     if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
        --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
        --         vim.defer_fn(function() vim.api.nvim_feedkeys("gzaiw==", "n", false) end, 10)
        --     else
        --         vim.api.nvim_feedkeys("ysiw==", "n", false)
        --     end
        -- end

        -- Add a custom mapping to toggle conceallevel
        -- vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>lua require('obsidian').toggle_conceal()<CR>", { noremap = true, silent = true })
        vim.keymap.set({ "n", "i", "v", "x" }, "<C-e>", toggle_conceal, { noremap = true, silent = true })
    end,
}
