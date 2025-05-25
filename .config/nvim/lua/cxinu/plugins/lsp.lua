return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()

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

    -- Autoformat on save
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end,
    })

    -- LSP Server Setup
    local default_setup = function(server)
      lspconfig[server].setup({ capabilities = capabilities })
    end

    local lua_ls_setup = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { 'ngx', 'jit' },
            },
            workspace = { library = { vim.env.VIMRUNTIME, "${3rd}/luv/library", "/opt/openresty/lualib" } },
          },
        },
      })
    end

    -- Mason and LSP server configuration
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd", "ts_ls", "gopls", "zls", "rust_analyzer" },
      handlers = {
        default_setup,
        lua_ls = lua_ls_setup,
      },
    })
  end,
}
