local M = {}

-- this is comment
local color_lua_setup = function(colorname)
  require(colorname).setup{
    style = "deep",
    term_colors = false,

    code_style = {
      keywords = "bold",
      functions = "bold",
    }
  }
end

M.config_colorscheme = function(colorname)
  if pcall(color_lua_setup, colorname) then
    color_lua_setup(colorname)
  end

  vim.cmd("colorscheme "..colorname)
end

return M
