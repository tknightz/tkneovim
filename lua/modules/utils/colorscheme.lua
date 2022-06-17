local M = {}

local color_lua_setup = function(colorname)
  require(colorname).setup{
    style = "darker",
    dark_theme = "onedark",
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
      PmenuSel = { fg = "NONE", bg = "#305676" },
      LspSagaHoverBorder = { fg = "#2e3c43" },
      BufferLineBufferVisible = { fg = "gray", bg = "#212535" },
      BufferLineBufferSelected = { bg = "#0c0411" },
      BufferLineFill = { bg = "#1a1d2a" },
      BufferLineSeparator = { fg = "#1a1d2a" },
      BufferLineSeparatorSelected = { fg = "#1a1d2a", bg = "#0c0411" },
      BufferLineSeparatorVisible = { fg = "#1a1d2a", bg = "#212535" },
      BufferLineDuplicateVisible = { fg = "gray", bg = "#212535" },
      BufferLineDuplicateSelected = { fg = "gray", bg = "#c0411" },
      DashboardHeader = { fg = "#555555" }, 
      DashboardCenter = { fg = "#555555" }, 
      DashboardFooter = { fg = "#555555" }, 
      DashboardShortcut = { fg = "#555555" }, 
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
