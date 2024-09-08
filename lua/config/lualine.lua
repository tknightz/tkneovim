local special_fts = require("lib.consts").special_fts

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "tkonedark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
    }
  },
  sections = {
    lualine_a = { {
      "mode",
      fmt = function(str)
        return " " .. str
      end,
    } },
    lualine_b = {
      {
        "branch",
        color = { fg = "#00c65c", gui = "bold" },
        fmt = function(str)
          local end_sign = string.len(str) > 20 and "..." or ""
          return string.sub(str, 0, 20) .. end_sign
        end,
      },
      {
        "diff",
        colored = true,
        symbols = {added = ' 󰐙 ', modified = ' 󰣕 ', removed = ' 󰍚 '},
        diff_color = {
          added = { fg = "#3eff7b" },
          modified = { fg = "#ff722e" },
          removed = { fg = "#dc1616" },
        },
      },
    },
    lualine_c = {
      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = { right = 0, left = 1 },
      },
      {
        "filename",
        path = 1,
        shorting_target = 30,
        fmt = function(str)
          local filetype = vim.api.nvim_buf_get_option(0, "filetype")
          if filetype == "NvimTree" or filetype == "neo-tree" then
            return "Explorer"
          end

          if filetype == "fugitive" then
            return "FugitiveGit"
          end

          return str
        end,
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = " ", warn = "󰀪 ", hint = "󰌶 ", info = "  " },
      },
    },
    lualine_x = {
      {
        "wordcount",
        cond = function()
          return vim.bo.filetype == "markdown"
        end,
        fmt = function()
          return tostring(vim.fn.wordcount().words) .. " words"
        end
      },
      {
        "filesize",
        fmt = function(str)
          local total_lines = vim.api.nvim_buf_line_count(0)
          return str .. "   " .. total_lines .. " lines"
        end,
      },
      {
        "encoding",
        fmt = function(str)
          local fformat = vim.api.nvim_buf_get_option(0, "fileformat")
          local pre = str ~= "" and " " .. str .. "  " or ""
          return pre .. "  " .. fformat
        end,
      },
    },
    lualine_y = { "filetype" },
    lualine_z = { "progress", "location" },
  },
  winbar = {},
  inactive_winbar = {},
  tabline = {},
  extensions = {},
})
