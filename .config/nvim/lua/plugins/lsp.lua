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
                        workspace = { library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" } },
                    },
                },
            })
        end

        -- Mason and LSP server configuration
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "clangd", "pyright", "zls", "gopls", "rust_analyzer" },
            handlers = {
                default_setup,
                lua_ls = lua_ls_setup,
            },
        })
    end,
}
