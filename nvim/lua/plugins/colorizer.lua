return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup {
      filetypes = {
        "*",
        css = { rgb_fn = true },
      },
      user_default_options = {
        names = false,
      },
    }
  end,
  lazy = true,
}
