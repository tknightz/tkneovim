local M = {}

M.build_init_module = function(path)
  local home_config_path = vim.fn.expand("~") .. '/.config/nvim/lua/'
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
  vim.cmd("packadd ".. name)

  local home_config = vim.fn.expand('~') .. '/.config/nvim/lua/'
  local setup_path = 'modules/setup/' .. name
  local config_path = 'modules/config/' .. name

  local is_existed_setup_file = vim.fn.filereadable(home_config .. setup_path .. '.lua') + vim.fn.isdirectory(home_config .. setup_path)
  local is_existed_config_file = vim.fn.filereadable(home_config .. config_path .. '.lua') + vim.fn.isdirectory(home_config .. config_path)

  if is_existed_setup_file ~= 0 then
    vim.cmd("lua require('" .. setup_path .. "')")
  end

  if is_existed_config_file ~= 0 then
    vim.cmd("lua require('" .. config_path .. "')")
  end

end

return M
