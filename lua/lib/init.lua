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

return M
