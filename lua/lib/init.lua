local M = {}

M.get_win_id = function(buf_id)
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    -- Get the buffer ID associated with the window
    local win_buf_id = vim.api.nvim_win_get_buf(win)

    -- Check if the buffer ID matches the desired value
    if win_buf_id == buf_id then
      -- Print the window ID
      return win
    end
  end

  return nil
end

-- write a documentation for this function
--- @param path string
--- @return table
M.build_init_module = function(path)
  local home_config_path = vim.fn.stdpath("config") .. "/lua/"
  local module_files = vim.fn.globpath(home_config_path .. path, "*", 0, 1)
  local exported_module = {}

  for idx, file in pairs(module_files) do
    local file_name = vim.fn.fnamemodify(file, ":t:r")
    if file_name ~= "init" then
      local require_path = path .. file_name
      exported_module[file_name] = require(require_path)
    end
  end

  return exported_module
end

M.load_module = function(name)
  vim.cmd("Lazy! load " .. name)

  local home_config_path = vim.fn.stdpath("config") .. "/lua/"
  local setup_path = "modules/setup/" .. name
  local config_path = "modules/config/" .. name

  local is_existed_setup_file = vim.fn.filereadable(home_config_path .. setup_path .. ".lua")
    + vim.fn.isdirectory(home_config_path .. setup_path)
  local is_existed_config_file = vim.fn.filereadable(home_config_path .. config_path .. ".lua")
    + vim.fn.isdirectory(home_config_path .. config_path)

  if is_existed_setup_file ~= 0 then
    vim.cmd("lua require('" .. setup_path .. "')")
  end

  if is_existed_config_file ~= 0 then
    vim.cmd("lua require('" .. config_path .. "')")
  end
end

M.read_file = function(path)
  local file_path = vim.fn.expand(path) -- Full path to the file

  -- Open the file in read mode
  local file = io.open(file_path, "r")
  if file then
    -- Read the content of the file
    local content = file:read("*all")

    -- Close the file
    file:close()

    -- Return the API key
    content = content:gsub("[\r\n]+$", "")
    return content
  else
    -- Handle error if file doesn't exist or cannot be opened
    return nil
  end
end

return M
