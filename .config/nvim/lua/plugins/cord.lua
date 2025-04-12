return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VeryLazy",
  opts = {
    display = {
      theme = 'atom',
      flavor = 'accent',
      swap_fields = false,
      swap_icons = false,
    },
  },
}
