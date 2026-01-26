local M = {}
local horiz_term_buf = nil
local horiz_term_win = nil

function M.toggle()
  if horiz_term_buf and vim.api.nvim_buf_is_valid(horiz_term_buf) then
    if horiz_term_win and vim.api.nvim_win_is_valid(horiz_term_win) then
      vim.api.nvim_win_close(horiz_term_win, true)
      horiz_term_win = nil
    else
      vim.cmd("split | buffer " .. horiz_term_buf)
      horiz_term_win = vim.api.nvim_get_current_win()
      vim.cmd "startinsert"
    end
  else
    vim.cmd "split | term"
    horiz_term_buf = vim.api.nvim_get_current_buf()
    horiz_term_win = vim.api.nvim_get_current_win()
    vim.cmd "startinsert"
  end
end

return M
