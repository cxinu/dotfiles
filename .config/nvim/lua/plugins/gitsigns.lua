return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add = { text = "|" },
      change = { text = "|" },
      delete = { text = "|" },
      topdelete = { text = "|" },
      changedelete = { text = "|" },
    },
  },
}
