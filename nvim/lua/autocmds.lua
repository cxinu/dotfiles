vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_user_command('GitBlameLine', function()
  local filename = vim.api.nvim_buf_get_name(0)
  if filename == '' then
    vim.notify('GitBlameLine: buffer has no file', vim.log.levels.WARN)
    return
  end
  local line_number = vim.fn.line('.')
  local res = vim
    .system({ 'git', 'blame', '-L', line_number .. ',+1', '--', filename }, { cwd = vim.fs.dirname(filename), text = true })
    :wait()
  if res.code ~= 0 then
    local err = vim.trim(res.stderr or '')
    vim.notify('GitBlameLine: ' .. (err ~= '' and err or 'git blame failed'), vim.log.levels.ERROR)
    return
  end
  print(vim.trim(res.stdout))
end, { desc = 'Print the git blame for the current line' })

vim.api.nvim_create_user_command('W', function() vim.cmd('noautocmd write') end, {})

-- autosave: on leaving insert mode, switching buffers, or losing focus
-- (not on TextChanged, which would run the formatter after almost every edit)
local function autosave(ev)
  local buf = ev.buf
  if
    not vim.api.nvim_buf_is_valid(buf)
    or not vim.bo[buf].modified
    or not vim.bo[buf].modifiable
    or vim.bo[buf].readonly
    or vim.bo[buf].buftype ~= ''
    or vim.api.nvim_buf_get_name(buf) == ''
  then
    return
  end
  vim.api.nvim_buf_call(buf, function() vim.cmd('silent! write') end)
end

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufLeave', 'FocusLost' }, {
  group = vim.api.nvim_create_augroup('AutoSave', { clear = true }),
  callback = autosave,
})
