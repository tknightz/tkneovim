local build_keymaps = require("lib").build_keymaps

local M = {}

M.build_server_config = function(server)
  local server_config = vim.lsp.config[server]
  local default_on_attach = require("config.lsp.preset").on_attach

  if not server_config then
    local config = M.general_configs
    config.on_attach = default_on_attach
    return config
  end

  local default_keymaps = require("config.lsp.preset").on_attach_keymaps
  local custom_keymaps = server_config.keys and server_config.keys or {}

  local keymaps = vim.tbl_extend("force", default_keymaps, custom_keymaps)
  local on_attach = function(client, bufnr)
    require("config.lsp.preset").on_attach(client, bufnr)
    build_keymaps(bufnr, keymaps)
  end

  local config = server_config and vim.tbl_extend("force", M.general_configs, server_config) or M.general_configs
  config.on_attach = on_attach

  return config
end

return M
