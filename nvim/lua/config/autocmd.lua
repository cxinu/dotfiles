-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Hide line numbers in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Disable LSP semantic highlighting
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

-- Force Treesitter to stick to the Zen palette
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local hl = function(g, opts)
      vim.api.nvim_set_hl(0, g, opts)
    end
    local mint = "#789978"

    -- Treesitter groups
    hl("@variable", { fg = "NONE" }) -- Variables stay neutral (Luster)
    hl("@function", { fg = mint }) -- Functions are Mint
    hl("@keyword", { fg = "NONE", bold = true }) -- Keywords are just Bold
    hl("@string", { fg = mint }) -- Strings are Mint
    hl("@comment", { fg = "#555555", italic = true })
  end,
})
