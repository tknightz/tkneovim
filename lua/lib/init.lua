local M = {}

M.build_init_module = function(path)
  local home_config_path = vim.fn.stdpath("config") .. '/lua/'
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
  vim.cmd("Lazy load ".. name)

  local home_config_path = vim.fn.stdpath('config') .. '/lua/'
  local setup_path = 'modules/setup/' .. name
  local config_path = 'modules/config/' .. name

  local is_existed_setup_file = vim.fn.filereadable(home_config_path .. setup_path .. '.lua') + vim.fn.isdirectory(home_config_path .. setup_path)
  local is_existed_config_file = vim.fn.filereadable(home_config_path .. config_path .. '.lua') + vim.fn.isdirectory(home_config_path .. config_path)

  if is_existed_setup_file ~= 0 then
    vim.cmd("lua require('" .. setup_path .. "')")
  end

  if is_existed_config_file ~= 0 then
    vim.cmd("lua require('" .. config_path .. "')")
  end

end

return M
