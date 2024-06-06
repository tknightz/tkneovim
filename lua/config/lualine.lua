local special_fts = require("lib.consts").special_fts

local function navic()
  local _, location = pcall(require("nvim-navic").get_location)
  if location ~= nil and location ~= '' then
    return "  " .. location
  end
end

local function winbar_fmt(entry, _)
  local bufname = entry
  local is_in_diffmode = vim.api.nvim_win_get_option(0, "diff")

  -- if in diffmode I don't wanna it show lsp and long filename
  if is_in_diffmode then
    local filename = vim.fn.fnamemodify(bufname, ":t")
    if filename == "null" then
      return "Deleted file"
    end

    local is_v1 = string.match(bufname, "/.git/")
    return is_v1 and filename .. " (v1)" or filename .. " (v2)"
  end

  local filename = vim.fn.fnamemodify(bufname, ":.")
  filename = filename ~= "." and filename or vim.fn.fnamemodify(bufname, ":t")
  local result = string.gsub(filename, "/", "  ")

  return result
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "tkonedark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
    globalstatus = true,
    -- disabled_filetypes = {
    --   winbar = special_fts,
    -- },
    -- ignore_focus = special_fts,
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
        color = { fg = "#ffffff" },
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
  inactive_sections = {
    lualine_a = {
      function()
        -- vim.cmd[[hi lualine_a_inactive guibg=#16327F guifg=#541b6a gui=bold]]
        return ""
      end,
    },
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  -- winbar = {
  --   lualine_c = {
  --     {
  --       "filetype",
  --       icon_only = true,
  --       separator = "",
  --       padding = { right = 0, left = 1 },
  --       color = "WinBar",
  --     },
  --     {
  --       "filename",
  --       path = 0,
  --       file_status = false,
  --       newfile_status = false,
  --       color = "WinBar",
  --     },
  --     {
  --       "navic",
  --       fmt = navic,
  --       color = "WinBar",
  --     }
  --   },
  -- },
  winbar = {},
  -- inactive_winbar = {
  --   lualine_c = {
  --     {
  --       "filetype",
  --       icon_only = true,
  --       separator = "",
  --       color = "InactiveWinBar",
  --       padding = { right = 0, left = 1 },
  --     },
  --     {
  --       "filename",
  --       path = 2,
  --       color = "InactiveWinBar",
  --       fmt = winbar_fmt,
  --     }
  --   },
  -- },
  inactive_winbar = {},
  tabline = {},
  extensions = {},
})
