local conform = require('conform')

local web_types = { 'javascript', 'typescript', 'jsx', 'tsx', 'html', 'css', 'markdown' }
local formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'ruff' },
  go = { 'gofmt' },
  rust = { 'rustfmt' },
  typst = { 'typstyle' },
  sh = { 'shfmt' },
  nix = { 'nixpkgs_fmt' },
  c = { 'clang-format' },
  cu = { 'clang-format' },
  cpp = { 'clang-format' },
  json = { 'prettierd', 'jq', stop_after_first = true },
}

for _, ft in ipairs(web_types) do
  formatters_by_ft[ft] = { 'prettierd' }
end

-- Filetypes where format-on-save is skipped (manual <leader>bf still works)
local skip_on_save = { c = true, cpp = true, cu = true }

conform.setup({
  formatters_by_ft = formatters_by_ft,
  format_on_save = function(bufnr)
    if skip_on_save[vim.bo[bufnr].filetype] then return nil end
    return {
      timeout_ms = 2000,
      lsp_format = 'fallback',
    }
  end,
})

vim.keymap.set(
  { 'n', 'v' },
  '<leader>bf',
  function()
    conform.format({
      async = true,
      lsp_format = 'fallback',
    })
  end,
  { desc = 'Format buffer or selection' }
)
