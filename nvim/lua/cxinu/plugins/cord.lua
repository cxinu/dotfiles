return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VeryLazy",
  opts = {
    editor = {
      tooltip = "Ur Moms Favorite Text-Editor",
    },
    display = {
      theme = "atom",
      flavor = "accent",
      swap_fields = false,
      swap_icons = false,
    },
  },
}
