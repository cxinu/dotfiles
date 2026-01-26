return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lsp_keymaps = {
      { "n", "gd", vim.lsp.buf.definition,      "Goto definition" },
      { "n", "gD", vim.lsp.buf.declaration,     "Goto declaration" },
      { "n", "gi", vim.lsp.buf.implementation,  "Goto implementation" },
      { "n", "go", vim.lsp.buf.type_definition, "Goto type def" },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local buf = event.buf
        for _, km in ipairs(lsp_keymaps) do
          vim.keymap.set(km[1], km[2], km[3], { desc = km[4], buffer = buf })
        end
      end,
    })

    -- Mason and default LSP server
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd", "ts_ls", "gopls", "zls", "rust_analyzer" },
    })
  end,
}
