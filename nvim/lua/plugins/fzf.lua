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
    -- 1. FAST NAVIGATION
    { "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "Switch Buffers" },
    { "<leader>-", "<cmd>FzfLua files<cr>", desc = "Find Files (Root)" },
    { "<leader>.", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },

    -- 2. DISCOVERY (The "Pro" Grep Workflow)
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep (Global Search)" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Word Under Cursor" },
    { "<leader>fW", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "Grep Selection" },
    { "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Fuzzy Search Current Buffer" },

    -- 3. API DISCOVERY (LSP Replacement for Power Users)
    { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "LSP: Goto Definition" },
    { "gr", "<cmd>FzfLua lsp_references<cr>", desc = "LSP: Find References" },
    { "gs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Fzf: Document Symbols" },
    { "gS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Fzf: Workspace Symbols" },

    -- 4. UTILITY & SYSTEM
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Find Todos" },
  },
  opts = {
    -- The "Pro" look: Minimalist, fast, out of the way
    winopts = {
      preview = {
        default = "bat", -- Use bat for syntax highlighting in preview
        layout = "vertical",
        vertical = "down:45%",
      },
    },
    fzf_opts = {
      ["--tiebreak"] = "index", -- Keeps search stable
    },
    -- Use path.filename_first for better readability in projects
    files = { formatter = "path.filename_first" },
  },
}
