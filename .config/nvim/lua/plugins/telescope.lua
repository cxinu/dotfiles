return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons",              enabled = vim.g.have_nerd_font },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local action_layout = require("telescope.actions.layout")
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-BS>"] = function()
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<C-w>", true, false, true),
                "i", true)
            end,
            ["<M-p>"] = action_layout.toggle_preview,
          },
        },
      },
      pickers = {
        current_buffer_fuzzy_find = {
          theme = "ivy",
          previewer = false,
        },
        man_pages = {
          sections = { "1", "2", "3", "3p", "4", "5", "6", "7", "8", "9", "n", "l" }
        },
      },
    })

    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>-", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fn", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end,
      { desc = "[F]ind [N]eovim files" })
    vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "[F]ind [M]an Pages" })
    vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "[F]ind [B]uiltins" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
    vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope, { desc = "[F]ind [T]odos" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Existing buffers" })
    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search buffer" })
  end,
}
