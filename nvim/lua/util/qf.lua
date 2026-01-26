local M = {}

-- Toggle the Quickfix window
function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists then
    vim.cmd "cclose"
  else
    vim.cmd "copen"
  end
end

-- Toggle Diagnostics into Quickfix
function M.toggle_diagnostics()
  local qf = vim.fn.getqflist { winid = 0 }
  if qf.winid ~= 0 then
    vim.cmd "cclose"
  else
    vim.fn.setqflist {}
    vim.diagnostic.setqflist { open = true }
  end
end

return M
