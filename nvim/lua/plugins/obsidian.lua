require('obsidian').setup({
  legacy_commands = false, -- this will be removed in 4.0.0
  workspaces = {
    { name = 'wiki', path = '~/wiki' },
  },
  daily_notes = {
    folder = '00 Inbox',
    date_format = '%Y-%m-%d',
    default_tags = { 'daily-notes' },
  },
  note_id_func = function(title)
    if title == nil or title == '' then return tostring(os.time()) end
    local id = title:lower()
    id = id:gsub('[/\\:#?*"<>|]', '') -- characters invalid or awkward in filenames
    id = id:gsub('%s+', '-')
    return id -- gsub's second return value is dropped (assigned, not returned directly)
  end,
})

-- Conceal handling: per markdown buffer, not global
local function toggle_conceal() vim.wo.conceallevel = vim.wo.conceallevel == 0 and 1 or 0 end

local function setup_markdown_buffer(buf)
  vim.opt_local.conceallevel = 1
  vim.keymap.set({ 'n', 'i' }, '<C-e>', toggle_conceal, { buffer = buf, silent = true, desc = 'Toggle conceal' })
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('ObsidianMarkdown', { clear = true }),
  pattern = 'markdown',
  callback = function(ev) setup_markdown_buffer(ev.buf) end,
})

-- cover markdown buffers that were opened before this file ran
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == 'markdown' then
    vim.api.nvim_buf_call(buf, function() setup_markdown_buffer(buf) end)
  end
end

vim.keymap.set('n', '<leader>oo', '<cmd>Obsidian open<CR>', { desc = 'Obsidian: Open note or current buffer' })
vim.keymap.set('n', '<leader>of', '<cmd>Obsidian search<CR>', { desc = 'Obsidian: Search notes' })
vim.keymap.set('n', '<leader>on', '<cmd>Obsidian quick_switch<CR>', { desc = 'Obsidian: Quick switch notes' })
vim.keymap.set('n', '<leader>op', '<cmd>Obsidian paste_img<CR>', { desc = 'Obsidian: Paste image' })
vim.keymap.set('n', '<leader>od', '<cmd>Obsidian dailies<CR>', { desc = 'Obsidian: Open dailies picker' })
