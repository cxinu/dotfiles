require('fzf-lua').setup({
  fzf_colors = true,
  winopts = {
    split = 'belowright new',
    height = 0.50,
    width = 1.00,
    preview = {
      layout = 'horizontal',
      horizontal = 'right:50%',
    },
  },
  keymap = {
    fzf = {
      ['ctrl-q'] = 'select-all+accept',
    },
  },
  grep = {
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
  },
  fzf_opts = { ['--tiebreak'] = 'index' },
  files = { formatter = 'path.filename_first' },
})
vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua buffers<cr>', { desc = 'Switch Buffers' })
vim.keymap.set('n', '<leader>-', '<cmd>FzfLua files<cr>', { desc = 'Find Files (Root)' })
vim.keymap.set('n', '<leader>.', '<cmd>FzfLua oldfiles<cr>', { desc = 'Recent Files' })

vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword<cr>', { desc = 'Grep Word Under Cursor' })
vim.keymap.set('x', '<leader>fW', '<cmd>FzfLua grep_visual<cr>', { desc = 'Grep Selection' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua lgrep_curbuf<cr>', { desc = 'Fuzzy Search Current Buffer' })

vim.keymap.set('n', '<leader>la', '<cmd>FzfLua lsp_finder<cr>', { desc = 'LSP: Finder (Def/Ref/Impl)' })
vim.keymap.set(
  'n',
  '<leader>ls',
  '<cmd>FzfLua lsp_live_workspace_symbols<cr>',
  { desc = 'LSP: Live Workspace Symbols' }
)
vim.keymap.set('n', '<leader>lS', '<cmd>FzfLua lsp_document_symbols<cr>', { desc = 'LSP: Document Symbols' })

vim.keymap.set('n', '<leader>fm', '<cmd>FzfLua man_pages<cr>', { desc = 'Find Man Pages' })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua builtin<cr>', { desc = 'Find Fzf Builtins' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>', { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fk', '<cmd>FzfLua keymaps<cr>', { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua resume<cr>', { desc = 'Resume Last Search' })
vim.keymap.set('n', '<leader>fq', '<cmd>FzfLua quickfix<cr>', { desc = 'Search Quickfix List' })
vim.keymap.set('n', '<leader>ft', '<cmd>TodoFzfLua<cr>', { desc = 'Find Todos' })

-- Functional mappings (Closures)
vim.keymap.set(
  'n',
  '<leader>fn',
  function() require('fzf-lua').files({ cwd = vim.fn.stdpath('config') }) end,
  { desc = 'Find Neovim Config' }
)

vim.keymap.set('n', '<leader>fg', function()
  local dir = vim.fn.input('Grep in dir: ', vim.fn.getcwd(), 'dir')
  if dir ~= '' then require('fzf-lua').live_grep({ cwd = dir }) end
end, { desc = 'Live Grep (Custom Dir)' })

vim.keymap.set('n', '<leader>fF', function()
  local dir = vim.fn.input('Files in dir: ', vim.fn.getcwd(), 'dir')
  if dir ~= '' then require('fzf-lua').files({ cwd = dir }) end
end, { desc = 'Find Files (Custom Dir)' })

vim.keymap.set('n', '<leader>fG', function()
  require('fzf-lua').fzf_exec('fd --type d --hidden --exclude .git . /', {
    prompt = 'Grep in Dir> ',
    preview = 'eza --tree --level=2 --color=always {} 2>/dev/null || ls {}',
    actions = {
      ['default'] = function(selected)
        local dir = selected[1] or vim.fn.getcwd()
        require('fzf-lua').live_grep({ cwd = dir })
      end,
      ['ctrl-g'] = function() require('fzf-lua').live_grep({ cwd = vim.fn.getcwd() }) end,
    },
  })
end, { desc = 'Live Grep (FZF Dir Pick)' })
