local function close_diff_wins()
  local current_windows = vim.api.nvim_list_wins()
  local my_winnr = vim.api.nvim_get_current_win()

  for _, winnr in ipairs(current_windows) do
    if winnr ~= my_winnr and vim.api.nvim_win_get_option(winnr, 'diff') then
      -- Perform actions on the diff window
      vim.api.nvim_win_close(winnr, true)
    end
  end
end

vim.keymap.set('n', 'dq', close_diff_wins, { noremap = true, buffer = true })
