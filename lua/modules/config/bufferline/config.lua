local highlights = require("modules.config.bufferline.highlights")

require("modules.config.bufferline.mappings")

require("bufferline").setup({
  highlights = highlights,
  options = {
    offsets = {
      { filetype = "NvimTree", text = "Explorer" },
      { filetype = "neo-tree", text = "Explorer" },
      { filetype = "dbui", text = "DB Explorer" },
      { filetype = "DiffviewFiles", text = "DiffviewFiles" },
    },
    themable = true,
    buffer_close_icon = "",
    modified_icon = "",
    indicator = {
      icon = "|",
    },
    close_icon = "",
    left_trunc_marker = " ",
    right_trunc_marker = " ",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = false,
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _, _)
      local icon = " "
      if level:match("error") then
        icon = " "
      elseif level:match("warn") then
        icon = " "
      elseif level:match("hint") then
        icon = " "
      end
      return icon .. "(" .. count .. ")"
    end,
    custom_filter = function(buf_number, _)
      -- filter out filetypes you don't want to see
      if
        vim.bo[buf_number].filetype ~= "packer"
        and vim.bo[buf_number].filetype ~= "terminal"
        and vim.bo[buf_number].filetype ~= "TelescopePrompt"
        and vim.bo[buf_number].filetype ~= "alpha"
        and vim.bo[buf_number].filetype ~= "fugitive"
        and vim.bo[buf_number].filetype ~= "qf"
        and vim.bo[buf_number].filetype ~= "gitcommit"
        and vim.bo[buf_number].filetype ~= "NvimTree"
      then
        return true
      else
        return false
      end
    end,
  },
})
