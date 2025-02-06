vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

-- RunCmd command
function RunCommandInSplit(cmd)
    vim.cmd('split | terminal ' .. cmd)
    vim.cmd('startinsert')
end

vim.api.nvim_create_user_command('RunCmd', function(opts)
    RunCommandInSplit(opts.args)
end, { nargs = 1 })

vim.api.nvim_set_keymap('n', '.', ':RunCmd ', { noremap = true, silent = false })
