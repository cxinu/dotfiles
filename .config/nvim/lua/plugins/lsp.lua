return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp = require("cmp")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

        -- ### LSP Keymaps
        local lsp_keymaps = {
            { "n",          "K",          vim.lsp.buf.hover,                                   "Hover" },
            { "n",          "gd",         vim.lsp.buf.definition,                              "Goto definition" },
            { "n",          "gD",         vim.lsp.buf.declaration,                             "Goto declaration" },
            { "n",          "gi",         vim.lsp.buf.implementation,                          "Goto implementation" },
            { "n",          "go",         vim.lsp.buf.type_definition,                         "Goto type def" },
            { "n",          "gr",         vim.lsp.buf.references,                              "Goto references" },
            { "n",          "gs",         vim.lsp.buf.signature_help,                          "Signature help" },
            { "n",          "<leader>cr", vim.lsp.buf.rename,                                  "Rename" },
            { "n",          "<leader>ca", vim.lsp.buf.code_action,                             "Code action" },
            { { "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format" },
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

        -- ### LSP Server Setup
        -- Default setup for most servers
        local default_setup = function(server)
            lspconfig[server].setup({ capabilities = lsp_capabilities })
        end

        -- Specific setup for lua_ls
        local lua_ls_setup = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
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

        -- ### nvim-cmp Setup
        -- Reusable bordered window configuration
        local bordered_window = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        })

        cmp.setup({
            sources = {
                { name = "copilot" }, -- Note: Ensure copilot plugin is installed
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = bordered_window,
                documentation = bordered_window,
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    with_text = true,
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end,
}
