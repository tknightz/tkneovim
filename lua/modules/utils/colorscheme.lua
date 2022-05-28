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

    highlights = {
      Folded = {fg = "#7a818e", bg = "#131421", fmt = "bold"},
      NvimTreeNormal = { fg = "#a0a8b7", bg = "#181b20" },
      NvimTreeFolderIcon = { fg = "#61afef" },
      QuickFixLine = { bg = "#7e3992", fg = "NONE", fmt = "NONE" },
      CmpBorder = { fg = "#2e3c43" },
      CmpWin = { bg = "NONE"},
      FloatBorder = { fg = "#2e3c43", bg = "NONE" },
      NormalFloat = { bg = "#191919" },
      PmenuSel = { fg = "NONE", bg = "#305676" }
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
