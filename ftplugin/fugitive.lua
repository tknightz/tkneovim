local function starts_with(my_string, prefix)
  return string.sub(my_string, 1, string.len(prefix)) == prefix
end

local get_listed_bufs = function()
  return vim.tbl_filter(function(bufnr)
    return vim.api.nvim_buf_get_option(bufnr, "buflisted")
  end, vim.api.nvim_list_bufs())
end

local function get_first_normal_buf()
  local current_bufs = get_listed_bufs()
  for idx, bufnr in ipairs(current_bufs) do
    local name = vim.api.nvim_buf_get_name(bufnr)
    if not starts_with(name, "fugitive") then
      return bufnr
    end
  end
end

-- local bufnr = vim.api.nvim_win_get_buf(winnr)
-- local bufname = vim.api.nvim_buf_get_name(bufnr)
local function close_diff_wins()
  local current_windows = vim.api.nvim_list_wins()
  local diff_wins = {}

  for _, winnr in ipairs(current_windows) do
    if vim.api.nvim_win_get_option(winnr, "diff") then
      table.insert(diff_wins, winnr)
    end
  end

  for idx, winnr in ipairs(diff_wins) do
    if idx ~= #diff_wins then
      vim.api.nvim_win_close(winnr, true)
    else
      local normal_buf = get_first_normal_buf()
      vim.api.nvim_win_set_buf(winnr, normal_buf)
    end
  end
end

-- local function after_git()
--   -- Check if FugitiveResult() exists.
--   if vim.fn.exists("*FugitiveResult") == 0 then
--     return
--   end
--
--   -- Call FugitiveResult() to get the result dictionary.
--   local result = vim.fn.FugitiveResult()
--
--   -- Check that the file (if any) exists.
--   local file = result.file or ""
--   if vim.fn.filereadable(file) == 0 then
--     return
--   end
--
--   -- Check that the first argument is 'commit'. Note: Vim lists are 0-indexed.
--   local args = result.args or {}
--   local first_arg = args[0] or ""
--   if first_arg ~= "commit" then
--     return
--   end
--
--   -- Only continue if there is a truthy exit_status.
--   if not result.exit_status then
--     return
--   end
--
--   -- Open the commit result in a new split buffer.
--   vim.cmd("Gsplit -")
-- end

-- Create an augroup and autocommand to trigger after Git commands.
-- vim.api.nvim_create_augroup("my_fugitive_stuff", { clear = true })
-- vim.api.nvim_create_autocmd("User", {
--   group = "my_fugitive_stuff",
--   pattern = "FugitiveChanged",
--   callback = after_git,
-- })

vim.keymap.set("n", "dq", close_diff_wins, { noremap = true, buffer = true })
