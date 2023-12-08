local M = {}

local color_lua_setup = function(colorname)
  require(colorname).setup({
    style = "deep",
    dark_theme = "onedark",
    transparent = false,
    code_style = {
      keywords = "italic,bold",
      functions = "bold",
    },

    disable = {
      background = true,
    },

    plugins = {
      bufferline = true,
    },

    colors = {
      bg = "#141b24",
      sidebar = "#10151c",
    },

    highlights = {
      ["@keyword.function"] = { fmt = "italic,bold" },
      Normal = { bg = "$bg" },
      EndOfBuffer = { bg = "$bg" },
      Sidebar = { bg = "$sidebar" },

      DiffviewNormal = { bg = "$sidebar" },
      DiffviewEndOfBuffer = { bg = "$sidebar" },
      TroubleNormal = { bg = "#181b20" },

      EdgyWinbar = { bg = "#12161F" },
      EdgyTitle = { bg = "#12161F", fg = "#c75ae8", fmt = "bold" },
      EdgyIcon = { bg = "#12161F", fg = "#c75ae8" },
      EdgyIconActive = { bg = "#12161F", fg = "#c75ae8" },
      EdgyNormal = { bg = "$sidebar" },

      NeoTreeWinSeparator = { bg = "NONE" },
      NeoTreeNormal = { bg = "$sidebar" },
      NeoTreeEndOfBuffer = { bg = "$sidebar" },
      NeoTreeNormalNC = { bg = "$sidebar" },

      WinSeparator = { bg = "NONE", fg = "#282c34" },
      WinBar = { bg = "$bg" },
      Folded = { bg = "#12161f", fmt = "bold" },
      -- FoldColumn = { bg = "$bg" },
      SignColumn = { bg = "NONE", fg = "#eb4d55", fmt = "nocombine" },
      FoldColumn = { bg = "NONE", fg = "#eb4d55", fmt = "nocombine" },
      CursorLineNr = { fg = "#bf68d9", fmt = "italic,bold" },
      UfoCursorFoldedLine = { bg = "#25112C", fmt = "bold" },
      UfoFoldedBg = { bg = "#25112c" },
      StatusLine = { bg = "NONE" },
      StatusLineNC = { bg = "NONE" },
      SymbolsOutlineBg = { bg = "#131313" },
      NvimTreeNormal = { bg = "#0a0e10" },
      NvimTreeFolderIcon = { fg = "#61afef" },
      NvimTreeVertSplit = { fg = "#3c3c3c" },
      NvimTreeWinSeparator = { fg = "#131313" },
      QuickFixLine = { bg = "#7e3992", fg = "NONE", fmt = "NONE" },
      CmpBorder = { fg = "#2e3c43" },
      CmpWin = { bg = "NONE" },
      CmpItemKindText = { fg = "#dd9046" },
      FloatBorder = { fg = "#2e3c43", bg = "NONE" },
      PmenuSel = { fg = "black", bg = "#4fa6ed" },
      LspSagaHoverBorder = { fg = "#2e3c43" },
      SagaBorder = { fg = "#7e3992" },
      DashboardHeader = { fg = "#41a7fc" },
      DashboardCenter = { fg = "#555555" },
      DashboardFooter = { fg = "#ed4a7a", fmt = "NONE" },
      DashboardShortcut = { fg = "#555555" },
      IndentLine = { fg = "#3b3b3b", fmt = "nocombine" },
      IndentBlanklineChar = { fg = "#3b3b3b" },
      IndentBlanklineContextChar = { fg = "#7e3992" },
      MiniIndentscopeSymbol = { fg = "#c75ae8" },
      CleverFChar = { fg = "#c75ae8", fmt = "bold,underline" },

      Whitespace = { fg = "#353535", fmt = "nocombine" },
      Nontext = { fg = "#5a5b5e", fmt = "nocombine" },
      TreesitterContext = { bg = "#2e3852" },
      TreesitterContextLineNumber = { fg = "#c75ae8", fmt = "bold,italic" },
      NormalFloat = { bg = "$bg" },
      InclineActive = { bg = "#61afef", fg = "#000000" },
      InclineInactive = { bg = "#282828", fg = "#515559" },
      FidgetTask = { fg = "gray", fmt = "italic,nocombine" },
      FidgetTitle = { fg = "#00d364", fmt = "nocombine" },

      IlluminatedWordText = { bg = "#1c364b", fmt = "NONE" },
      IlluminatedWordRead = { bg = "#1c364b", fmt = "NONE" },
      IlluminatedWordWrite = { bg = "#49212d", fmt = "NONE" },

      MatchWord = { bg = "#371d3f", fmt = "underline" },
      MatchParen = { fmt = "inverse" },
      MatchParenCur = { fmt = "nocombine" },

      TelescopePromptBorder = { fg = "#2e3c43" },
      TelescopeResultsBorder = { fg = "#2e3c43" },
      TelescopePreviewBorder = { fg = "#2e3c43" },
      TelescopeSelection = { bg = "#2e3c43" },
      TelescopePromptCounter = { fg = "#82aaff" },

      WhichKeyFloat = { bg = "none" },
      WhichKeyBorder = { fg = "#2e3c43" },
      WhichKeySeparator = { fg = "#00d364", fmt = "NONE" },

      GitSignsCurrentLineBlame = { fg = "#407F7F", fmt = "italic" },
      DiagnosticUnnecessary = { fg = "#455574", fmt = "underline" },
      LspSignatureActiveParameter = { bg = "NONE", fg = "#ed4a7a", fmt = "bold" },
      LspSignatureHint = { bg = "NONE", fg = "#4fa6ed", fmt = "bold" },
    },
  })
end

M.config_colorscheme = function(colorname)
  vim.g.material_disable_background = true
  if pcall(color_lua_setup, colorname) then
    color_lua_setup(colorname)
  end

  vim.cmd("colorscheme " .. colorname)
end

return M
