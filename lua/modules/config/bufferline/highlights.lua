local preset = {
  separator = "#0a0e10",
  modified = "#00d364",
  duplicate = "#3f3b42",
  warning = "#a98a50",
  hint = "#bf68d9",
  info = "#36848d",
  error = "#ab3f48",
}

local colors = {
  normal = { fg = "#3f3b42", bg = "#0f1218" },
  visible = { fg = "gray", bg = "#14171f" },
  selected = { fg = "#a0a8b7", bg = "#1a1c23" }
}

local highlights = {
  fill = { bg = preset.separator },
  background = { italic = true, nocombine = true },

  buffer_visible = { italic = true },
  buffer_selected = { bold = true, italic = false },

  tab = { italic = true },
  tab_selected = { bold = true, italic = false },

  tab_separator = { bg = preset.separator, fg = preset.separator },
  tab_separator_selected = { bg = preset.separator, fg = preset.separator },

  separator = { fg = preset.separator },
  separator_selected = { fg = preset.separator },
  separator_visible = { fg = preset.separator },

  modified = { fg = preset.modified },
  modified_selected = { fg = preset.modified },
  modified_visible = { fg = preset.modified },

  duplicate = { fg = preset.duplicate },
  duplicate_selected = { fg = preset.duplicate },
  duplicate_visible = { fg = preset.duplicate },

  warning = { fg = preset.warning, bold = true },
  warning_visible = { fg = preset.warning, italic = true },
  warning_selected = { fg = preset.warning, italic = true },
  warning_diagnostic = { fg = preset.warning, italic = false },
  warning_diagnostic_visible = { fg = preset.warning },
  warning_diagnostic_selected = { fg = preset.warning, italic = false },

  info = { fg = preset.info, bold = true },
  info_visible = { fg = preset.info, italic = true },
  info_selected = { fg = preset.info },
  info_diagnostic = { fg = preset.info, italic = false },
  info_diagnostic_visible = { fg = preset.info },
  info_diagnostic_selected = { fg = preset.info, italic = false },

  hint = { fg = preset.hint, bold = true },
  hint_visible = { fg = preset.hint, italic = true, bold = true },
  hint_selected = { fg = preset.hint },
  hint_diagnostic = { fg = preset.hint, italic = false },
  hint_diagnostic_visible = { fg = preset.hint },
  hint_diagnostic_selected = { fg = preset.hint, italic = false },

  error = { fg = preset.error, bold = true },
  error_visible = { fg = preset.error, italic = true },
  error_selected = { fg = preset.error, bold = true },
  error_diagnostic = { fg = preset.error, italic = false },
  error_diagnostic_visible = { fg = preset.error },
  error_diagnostic_selected = { fg = preset.error, italic = false, bold = true },
}

local result = {}

for key, val in pairs(highlights) do
  if key:find("visible") then
    result[key] = vim.tbl_extend("keep", val, colors.visible)
  elseif key:find("selected") then
    result[key] = vim.tbl_extend("keep", val, colors.selected)
  else
    result[key] = vim.tbl_extend("keep", val, colors.normal)
  end
end

return result
