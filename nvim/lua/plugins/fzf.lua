return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  ---@diagnostic enable: missing-fields
  keys = {
    { "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "Switch Buffers" },
    { "<leader>-", "<cmd>FzfLua files<cr>", desc = "Find Files (Root)" },
    { "<leader>.", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
    {
      "<leader>fn",
      function()
        require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
      end,
      desc = "Find Neovim Config",
    },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep (Global Search)" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Word Under Cursor" },
    { "<leader>fW", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "Grep Selection" },
    { "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Fuzzy Search Current Buffer" },

    { "<leader>la", "<cmd>FzfLua lsp_finder<cr>", desc = "LSP: Finder (Def/Ref/Impl)" },
    { "<leader>ls", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "LSP: Live Workspace Symbols" },
    { "<leader>lS", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "LSP: Document Symbols" },

    { "<leader>fm", "<cmd>FzfLua man_pages<cr>", desc = "Find Man Pages" },
    { "<leader>fb", "<cmd>FzfLua builtin<cr>", desc = "Find Fzf Builtins" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Search Quickfix List" },
    { "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Find Todos" },
  },
  opts = {
    winopts = {
      split = "belowright new",
      height = 0.50,
      width = 1.00,
      preview = {
        layout = "horizontal", -- Horizontal layout works better for bottom splits
        horizontal = "right:50%",
      },
    },
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept", -- Send all matches to quickfix
      },
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
    },
    fzf_opts = { ["--tiebreak"] = "index" }, -- Keeps search stable
    files = { formatter = "path.filename_first" }, -- Use path.filename_first for better readability in projects
  },
}
