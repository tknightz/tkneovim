local M = {}

local color_lua_setup = function(colorname)
  require(colorname).setup{
    style = "cool",
    transparent = true
  }
end

M.config_colorscheme = function(colorname)
  if pcall(color_lua_setup, colorname) then
    color_lua_setup(colorname)
  end

  vim.cmd("colorscheme "..colorname)
end

return M
