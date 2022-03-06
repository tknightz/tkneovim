local lib = require("lib")
local modules = lib.build_init_module("modules/source/")
local M = {}

for label, module in pairs(modules) do
  M = vim.tbl_extend("force", M, module)
end

return M
