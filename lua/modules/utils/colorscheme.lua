local M = {}

local color_lua_setup = function(colorname)
  require(colorname).setup{
    overrides = {
      CmpBorder = { fg = "#313750" },
      CmpWin = { bg = "NONE"},
      FloatBorder = { fg = "#313750", bg = "NONE" },
      NormalFloat = { bg = "NONE" },
      TelescopeBorder = { bg = "NONE" },
      Error = { fg = "#db4e6e", bold = true },
      ErrorMsg = { fg = "#db4e6e", bold = true },
      WinSeparator = { fg = "#1d1d2c" },
      IndentBlanklineChar = { fg = "#363652" },
      -- IndentBlanklineContextChar = { fg = "#1d1d2c" },
      DiagnosticError = { fg = "#db4e6e", italic = true, bg = "#35131b" },
      DiagnosticSignError = { fg = "#db4e6e", italic = false },
      DiagnosticHint = { fg = "#008bcc", italic = true, bg = "#002e3e" },
      DiagnosticSignHint = { fg = "#008bcc", italic = false },
    },
    transparent = true,
    code_style = {
      keywords = "italic,bold",
      functions = "bold"
    },

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
