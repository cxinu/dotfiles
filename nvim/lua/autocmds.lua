vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.')
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

vim.api.nvim_create_user_command('W', function() vim.cmd('noautocmd write') end, {})

-- autosave
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  group = vim.api.nvim_create_augroup('AutoSave', { clear = true }),
  callback = function()
    -- if the buffer has been modified and is a normal, writable file
    if vim.bo.modified and vim.bo.buftype == '' and vim.fn.filereadable(vim.fn.expand('%')) == 1 then
      vim.cmd('silent! write')
    end
  end,
})
