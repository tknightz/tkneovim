local M = {}

M.save_session = function(auto)
  local session_path = "~/.nvim/newest_nvim_session"
  if auto ~= true then
    session_path = vim.fn.input("[?] Session path : ", "")
  end

  if session_path == "" then
    print(" Aborted!")
    return false
  end

  session_path = vim.fn.expand(session_path)

  local result = vim.api.nvim_exec(":silent! mksession! " .. session_path, true)

  if result ~= "" then
    print(" Error while saving session.")
    return false
  end

  print(" Saved session to " .. session_path)
  return true
end

M.load_session = function(auto)
  local session_path = "~/.nvim/newest_nvim_session"
  if auto ~= true then
    session_path = vim.fn.input("[?] Session path : ", "", "file")
  end

  session_path = vim.fn.expand(session_path)

  local is_existed_session = vim.fn.filereadable(session_path)

  if is_existed_session ~= 1 then
    print(" Session is not existed!")
    return false
  end

  vim.api.nvim_exec(":silent! source " .. session_path, true)

  print(" Loaded session successful!")
  return true
end

M.quick_save_session = function()
  return M.save_session(true)
end

M.quick_load_session = function()
  return M.load_session(true)
end

return M
