return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = { "ObsidianOpen", "ObsidianQuickSwitch", "ObsidianSearch", "ObsidianSearchLink", "ObsidianSearchTag" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        workspaces = {
            { name = "wiki", path = "~/wiki" },
        },
        complitions = {
            nvim_cmp = true,
            min_chars = 0,
        },
        note_id_func = function(title)
            return title:lower():gsub(" ", "-")
        end,
        follow_url_func = function(url)
            vim.ui.open(url)
        end,
        ui = {
            bullets = { char = "◉", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
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
            if vim.wo.conceallevel == 0 then
                vim.wo.conceallevel = 2
            else
                vim.wo.conceallevel = 0
            end
        end

        vim.keymap.set({ "n", "i", "v", "x" }, "<C-e>", toggle_conceal, { noremap = true, silent = true })
    end,
}
