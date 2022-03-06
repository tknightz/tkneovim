local modules = require("modules.source")
local utils = require("modules.utils")

return require("packer").startup(function(use)
  use {
    "wbthomason/packer.nvim",
    cmd = {"PackerCompile", "PackerStatus", "PackerInstall", "PackerUpdate", "PackerLoad", "PackerClean"},
    config = function()
      require("modules.installer")
    end
  }

  for name, info in pairs(modules) do
    local packer_obj = utils.packer.build_packer_object(name, info)

    if name == "theme" then
      local colorname = info["colorname"]
      packer_obj["config"] = string.format("require('modules.utils.colorscheme').config_colorscheme('%s')", colorname)
    end

    use(packer_obj)
  end
end)
