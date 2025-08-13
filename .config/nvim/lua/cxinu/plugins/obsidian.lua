return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  dependencies = { "nvim-lua/plenary.nvim", "saghen/blink.cmp" },

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      { name = "wiki", path = "~/wiki" },
    },
    legacy_commands = false,
    completion = {
      nvim_cmp = false,
      blink = true,
      min_char = 1,
    },
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      default_tags = { "daily-notes" },
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
    local obsidian = require("obsidian").setup(opts)

    vim.wo.conceallevel = 2
    local toggle_conceal = function()
      if vim.wo.conceallevel == 0 then
        vim.wo.conceallevel = 2
      else
        vim.wo.conceallevel = 0
      end
    end

    vim.keymap.set({ "n", "i", "v", "x" }, "<C-e>", toggle_conceal, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian open<CR>", { desc = "Obsidian: Open note or current buffer" })
    vim.keymap.set("n", "<leader>of", "<cmd>Obsidian search<CR>", { desc = "Obsidian: Search notes" })
    vim.keymap.set("n", "<leader>on", "<cmd>Obsidian quick_switch<CR>", { desc = "Obsidian: Quick switch notes" })
    vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<CR>", { desc = "Obsidian: Paste image" })
    vim.keymap.set("n", "<leader>od", "<cmd>Obsidian dailies<CR>", { desc = "Obsidian: Open dailies picker" })
  end,
}
