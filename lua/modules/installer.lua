-- I declare my plugins in modules/source directory with my own spec
-- so have to compile to lazy spec
local modules = require("modules.source")
local utils = require("modules.utils")

local plugins = {}
for name, info in pairs(modules) do
  local spec = utils.plugin.build_plugin_spec(name, info)

  if name == "theme" then
    local colorname = info["colorname"]
    spec["config"] = function()
      require("modules.utils.colorscheme").config_colorscheme(colorname)
    end
  end

  table.insert(plugins, spec)
end

require("lazy").setup(plugins, {
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "onedark" },
  },
})
