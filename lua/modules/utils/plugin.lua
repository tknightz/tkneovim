local M = {}

local plugin_reversed_key = {
  enabled = 1,
  name = 1,
  installer = 1,
  updater = 1,
  after = 1,
  rtp = 1,
  lazy = 1,
  branch = 1,
  version = 1,
  commit = 1,
  pin = 1,
  build = 1,
  dependencies = 1,
  rocks = 1,
  config = 1,
  setup = 1,
  cmd = 1,
  ft = 1,
  keys = 1,
  event = 1,
  fn = 1,
  cond = 1,
  module = 1,
  module_pattern = 1,
  tag = 1,
}

M.build_plugin_spec = function(name, module)
  local obj = {module.path, name = name} 
  local home_config = vim.fn.stdpath('config') .. '/lua/'

  local setup_path = 'modules/setup/' .. name
  local config_path = 'modules/config/' .. name

  local is_existed_setup_file = vim.fn.filereadable(home_config .. setup_path .. '.lua') + vim.fn.isdirectory(home_config .. setup_path)
  local is_existed_config_file = vim.fn.filereadable(home_config .. config_path .. '.lua') + vim.fn.isdirectory(home_config .. config_path)

  for key, value in pairs(module) do
    if plugin_reversed_key[key] then
      obj[key] = value
    end
  end

  if is_existed_setup_file ~= 0 then
      obj["init"] = function()
        require(setup_path)
      end
  end

  if is_existed_config_file ~= 0 then
      obj["config"] = function()
        require(config_path)
      end
  end


  return obj
end

return M
