return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        go = { "goimports", "gofmt", stop_after_first = true },
        rust = { "rustfmt" },
        markdown = { "prettierd" },
        ts = { "prettierd" },
        js = { "prettierd" },
        jsx = { "prettierd" },
        tsx = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd", "jq", stop_after_first = true },
        sh = { "shfmt" },
        nix = { "nixpkgs_fmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }
  end,
}
