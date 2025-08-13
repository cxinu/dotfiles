return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        -- theme = "pywal16-nvim",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "branch",
            icon = "",
            separator = { left = "", right = "" },
          },
          {
            "diff",
            colored = true, -- Enable colored diff symbols
            symbols = { added = "+", modified = "~", removed = "-" }, -- Optional: Customize symbols
            diff_color = {
              added = { fg = "#a6e3a1" },
              modified = { fg = "#f9e2af" },
              removed = { fg = "#f38ba8" },
            },
          },
          {
            "diagnostics",
            colored = true, -- Enable colored diagnostics
            diagnostics_color = {
              error = { fg = "#f37799" },
              warn = { fg = "#ebd391" },
              info = { fg = "#6bd7ca" },
              hint = { fg = "#89d88b" },
            },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            -- color = { fg = "#222222" }, -- dimmed gray color
            color = "Comment", -- Alternatively use a highlight group: color = 'Comment'
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
