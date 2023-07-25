-- get lazy.nvim for plugins management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- I declare my plugins in modules/source directory with my own spec
-- so have to compile to lazy spec
local modules = require("modules.source")
local utils = require("modules.utils")

local plugins = {}
for name, info in pairs(modules) do
  local packer_obj = utils.packer.build_packer_object(name, info)

  if name == "theme" then
    local colorname = info["colorname"]
    packer_obj["config"] = function()
      require('modules.utils.colorscheme').config_colorscheme(colorname)
    end
  end

  table.insert(plugins, packer_obj)
end

-- print(vim.inspect(plugins))
require("lazy").setup(plugins)
