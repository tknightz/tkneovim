local M = {}

local color_lua_setup = function(colorname)
  require(colorname).setup{
    style = "darker",
    dark_theme = "onedark",
    transparent = true,
    transparent_background = true,
    code_style = {
      keywords = "italic,bold",
      functions = "bold"
    },

    disable = {
      background = true
    },

    plugins = {
      bufferline = true,
    },

    highlights = {
      Folded = {bg = "#181b20", fg = "#485e69", fmt = "bold"},
      NvimTreeNormal = { fg = "#a0a8b7", bg = "#181b20" },
      NvimTreeFolderIcon = { fg = "#61afef" },
      QuickFixLine = { bg = "#7e3992", fg = "NONE", fmt = "NONE" },
      CmpBorder = { fg = "#2e3c43" },
      CmpWin = { bg = "NONE"},
      FloatBorder = { fg = "#2e3c43", bg = "NONE" },
      PmenuSel = { fg = "NONE", bg = "#305676" },
      LspSagaHoverBorder = { fg = "#2e3c43" },
      DashboardHeader = { fg = "#555555" },
      DashboardCenter = { fg = "#555555" },
      DashboardFooter = { fg = "#555555" },
      DashboardShortcut = { fg = "#555555" },
      NvimTreeVertSplit = { fg = "#3c3c3c" },
      IndentBlanklineChar = { fg = "#3b3b3b" },
      Whitespace = { fg = "#353535", fmt = "nocombine" },
      Nontext = { fg = "#353535", fmt = "nocombine" },
      TreesitterContext = { bg = "#342b27" },
      TreesitterContextLineNumber = { fg = "#00d364" },
      NormalFloat = { bg = "NONE" },
      InclineActive = { bg = "#61afef", fg = "#000000"},
      InclineInactive = { bg = "#282828", fg = "#515559"},
      FidgetTask = { fg = "gray", fmt = "italic,nocombine" },
      FidgetTitle = { fg = "#00d364", fmt = "nocombine" },

      IlluminatedWordText = { bg = "#39435a", fmt = "NONE" },
      IlluminatedWordRead = { bg = "#39435a", fmt = "NONE" },
      IlluminatedWordWrite = { bg = "#49212d", fmt = "NONE" },
    }
  }
end

M.config_colorscheme = function(colorname)
  vim.g.material_disable_background = true
  if pcall(color_lua_setup, colorname) then
    color_lua_setup(colorname)
  end

  vim.cmd("colorscheme "..colorname)
end

return M
