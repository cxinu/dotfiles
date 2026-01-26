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
        javascript = { "prettierd" },
        jsx = { "prettierd" },
        tsx = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd", "jq", stop_after_first = true },
        sh = { "shfmt" },
        nix = { "nixpkgs_fmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      format_on_save = function(bufnr)
        local skip_filetypes = { "c", "cpp" } -- skip format_on_save list
        local ft = vim.bo[bufnr].filetype
        if vim.tbl_contains(skip_filetypes, ft) then
          return nil
        end
        return {
          timeout_ms = 2000,
          lsp_format = "fallback",
        }
      end,
    }

    vim.keymap.set({ "n", "v" }, "<leader>bf", function()
      require("conform").format {
        async = true,
        lsp_fallback = true,
      }
    end, { desc = "Format buffer or selection" })
  end,
}
