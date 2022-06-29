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
      Folded = {bg = "#181b20", fg = "#485e69", fmt = "bold"},
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
      BufferLineDuplicateVisible = { fg = "#3f3b42", bg = "#212535" },
      BufferLineDuplicateSelected = { fg = "#3f3b42", bg = "#0c0411" },
      BufferLineErrorVisible = { bg = "#212535" },
      BufferLineErrorSelected = { bg = "#0c0411" },
      BufferLineErrorDiagnosticVisible = { bg = "#212535" },
      BufferLineErrorDiagnosticSelected = { bg = "#0c0411" },
      BufferLineWarningVisible = { bg = "#212535" },
      BufferLineWarningSelected = { bg = "#0c0411" },
      BufferLineWarningDiagnosticVisible = { bg = "#212535" },
      BufferLineWarningDiagnosticSelected = { bg = "#0c0411" },
      BufferLineInfoVisible = { bg = "#212535" },
      BufferLineInfoSelected = { bg = "#0c0411" },
      BufferLineInfoDiagnosticVisible = { bg = "#212535" },
      BufferLineInfoDiagnosticSelected = { bg = "#0c0411" },
      BufferLineHintVisible = { bg = "#212535" },
      BufferLineHintSelected = { bg = "#0c0411" },
      BufferLineHintDiagnosticVisible = { bg = "#212535" },
      BufferLineHintDiagnosticSelected = { bg = "#0c0411" },
      DashboardHeader = { fg = "#555555" },
      DashboardCenter = { fg = "#555555" },
      DashboardFooter = { fg = "#555555" },
      DashboardShortcut = { fg = "#555555" },
      BufferLineModifiedVisible = { bg = "#212535" },
      BufferLineModifiedSelected = { bg = "#0c0411" },
      NvimTreeVertSplit = { fg = "#3c3c3c" },
      IndentBlanklineChar = { fg = "#3b3b3b" },
      Whitespace = { fg = "#353535", fmt = "nocombine" },
      Nontext = { fg = "#353535", fmt = "nocombine" },
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
