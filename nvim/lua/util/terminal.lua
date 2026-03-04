local M = {}
local horiz_term_buf = nil
local horiz_term_win = nil
local prev_buf = nil

local function close_term_window()
  if not (horiz_term_win and vim.api.nvim_win_is_valid(horiz_term_win)) then
    return
  end

  local wins = vim.api.nvim_list_wins()

  if #wins == 1 then
    if prev_buf and vim.api.nvim_buf_is_valid(prev_buf) then
      vim.api.nvim_set_current_buf(prev_buf)
    else
      vim.cmd "enew"
    end
  else
    vim.api.nvim_win_close(horiz_term_win, true)
  end

  horiz_term_win = nil
end

function M.toggle()
  -- If terminal buffer exists
  if horiz_term_buf and vim.api.nvim_buf_is_valid(horiz_term_buf) then
    -- If visible → close
    if horiz_term_win and vim.api.nvim_win_is_valid(horiz_term_win) then
      close_term_window()
      return
    end

    -- Not visible → open it
    prev_buf = vim.api.nvim_get_current_buf()
    vim.cmd "split"
    vim.api.nvim_set_current_buf(horiz_term_buf)
    horiz_term_win = vim.api.nvim_get_current_win()
    vim.cmd "startinsert"
    return
  end

  -- Create new terminal
  prev_buf = vim.api.nvim_get_current_buf()
  vim.cmd "split | term"
  horiz_term_buf = vim.api.nvim_get_current_buf()
  horiz_term_win = vim.api.nvim_get_current_win()
  vim.cmd "startinsert"
end

return M
