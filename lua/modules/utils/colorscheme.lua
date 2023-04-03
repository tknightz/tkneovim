local M = {}

vim.g.material_style = "deep ocean"

local color_lua_setup = function(colorname)
  require(colorname).setup{
    style = "deep",
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
      ["@keyword.function"] = { fmt = "italic,bold" },
      DiffviewNormal = { bg = "#0a0e10" },
      WinBar = { bg = "#1a1c23" },
      Folded = {bg = "#181b20", fg = "#485e69", fmt = "bold"},
      StatusLine = { bg = "NONE" },
      StatusLineNC = { bg = "NONE" },
      SymbolsOutlineBg = { bg = "#131313" },
      NvimTreeNormal = { bg = "#0a0e10" },
      NvimTreeFolderIcon = { fg = "#61afef" },
      NvimTreeVertSplit = { fg = "#3c3c3c" },
      NvimTreeWinSeparator = { fg="#131313" },
      QuickFixLine = { bg = "#7e3992", fg = "NONE", fmt = "NONE" },
      CmpBorder = { fg = "#2e3c43" },
      CmpWin = { bg = "NONE"},
      CmpItemKindText = { fg = "#dd9046"},
      FloatBorder = { fg = "#2e3c43", bg = "NONE" },
      PmenuSel = { fg = "black", bg = "#4fa6ed" },
      LspSagaHoverBorder = { fg = "#2e3c43" },
      SagaBorder = { fg = "#7e3992" },
      DashboardHeader = { fg = "#555555" },
      DashboardCenter = { fg = "#555555" },
      DashboardFooter = { fg = "#ed4a7a", fmt = "NONE" },
      DashboardShortcut = { fg = "#555555" },
      IndentBlanklineChar = { fg = "#3b3b3b" },
      IndentBlanklineContextChar = { fg = "#7e3992" },
      Whitespace = { fg = "#353535", fmt = "nocombine" },
      Nontext = { fg = "#353535", fmt = "nocombine" },
      TreesitterContext = { bg = "#342b27" },
      TreesitterContextLineNumber = { fg = "#00d364" },
      NormalFloat = { bg = "NONE" },
      InclineActive = { bg = "#61afef", fg = "#000000"},
      InclineInactive = { bg = "#282828", fg = "#515559"},
      FidgetTask = { fg = "gray", fmt = "italic,nocombine" },
      FidgetTitle = { fg = "#00d364", fmt = "nocombine" },

      IlluminatedWordText = { bg = "#1c364b", fmt = "NONE" },
      IlluminatedWordRead = { bg = "#1c364b", fmt = "NONE" },
      IlluminatedWordWrite = { bg = "#49212d", fmt = "NONE" },

      MatchWord = { bg = "#371d3f", fmt = "underline" },
      MatchParen = { fmt = "inverse" },

      TelescopePromptBorder = { fg = "#2e3c43" },
      TelescopeResultsBorder = { fg = "#2e3c43" },
      TelescopePreviewBorder = { fg = "#2e3c43" },
      TelescopeSelection = { bg = "#2e3c43" },
      TelescopePromptCounter = { fg = "#82aaff" },

      WhichKeyFloat = { bg = "#0a0e10" },
      WhichKeyBorder = { fg = "#2e3c43" },
      WhichKeySeparator = { fg = "#00d364", fmt = "NONE" },

      LspSignatureActiveParameter = { bg = "NONE", fg = "#ed4a7a", gui="bold" },
      LspSignatureHint = { bg = "NONE", fg = "#4fa6ed", gui="bold" },
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
