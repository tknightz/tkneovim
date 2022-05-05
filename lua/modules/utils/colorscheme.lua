local M = {}

-- this is comment
local color_lua_setup = function(colorname)
  require(colorname).setup{
    style = "darker",
    transparent = true,
    code_style = {
      keywords = "italic,bold",
      functions = "bold"
    },
  }
end

M.config_colorscheme = function(colorname)
  if pcall(color_lua_setup, colorname) then
    color_lua_setup(colorname)
  end

  vim.cmd("colorscheme "..colorname)
end

return M
