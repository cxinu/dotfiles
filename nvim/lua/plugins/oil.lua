local oil_nvim = {
  -- "stevearc/oil.nvim",
  dir = "~/Programming/cloned/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup {
      win_options = {
        signcolumn = "yes:2",
      },
      view_options = {
        show_hidden = false,
      },
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    }

    vim.keymap.set("n", "-", function()
      local ok, oil = pcall(require, "oil")
      if not ok then
        return
      end

      if type(oil.open_split) == "function" then
        oil.open_split()
      else
        oil.open()
      end
    end)
  end,
}

local oil_git_status = {
  "refractalize/oil-git-status.nvim",
  dependencies = { "stevearc/oil.nvim" },
  config = true,
}

return { oil_nvim, oil_git_status }
