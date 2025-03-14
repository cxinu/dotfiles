-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

--  Indent lines with custom colors
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "CustomIndentDarkGrey", { fg = "#1F1F1F" })
    end,
})

-- Hide line numbers in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- Toggle horizontal terminal
local horiz_term_buf = nil
local horiz_term_win = nil
function ToggleHorizontalTerm()
    if horiz_term_buf and vim.api.nvim_buf_is_valid(horiz_term_buf) then
        -- If already in the terminal, close the split
        if horiz_term_win and vim.api.nvim_win_is_valid(horiz_term_win) then
            vim.api.nvim_win_close(horiz_term_win, true)
            horiz_term_win = nil
        else
            -- Reopen the terminal in a horizontal split
            vim.cmd('split')
            vim.cmd('buffer ' .. horiz_term_buf)
            horiz_term_win = vim.api.nvim_get_current_win()
            vim.cmd('startinsert')
        end
    else
        -- Create a new horizontal split terminal
        vim.cmd('split')
        vim.cmd('term')
        horiz_term_buf = vim.api.nvim_get_current_buf()
        horiz_term_win = vim.api.nvim_get_current_win()
        vim.cmd('startinsert')
    end
end
