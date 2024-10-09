return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocomplete
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind-nvim",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover information", unpack(opts) })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition", unpack(opts) })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration", unpack(opts) })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation", unpack(opts) })
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "[G]oto [T]ype Definition", unpack(opts) })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences", unpack(opts) })
                vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "[G]oto [S]ignature Help", unpack(opts) })
                vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", unpack(opts) })
                vim.keymap.set(
                    { "n", "x" },
                    "<leader>cf",
                    function() vim.lsp.buf.format({ async = true }) end,
                    { desc = "Format document/selection", unpack(opts) }
                )
            end,
        })

        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

        local default_setup = function(server)
            require("lspconfig")[server].setup({
                capabilities = lsp_capabilities,
            })
        end

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "ts_ls", "rust_analyzer", "gopls", "zls", "pyright", "clangd" },
            handlers = {
                default_setup,
            },
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args) require("luasnip").lsp_expand(args.body) end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                }),
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
