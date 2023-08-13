local function winbar_fmt()
  local bufname = vim.api.nvim_buf_get_name(0)
  local is_in_diffmode = vim.api.nvim_win_get_option(0, "diff")

  -- if in diffmode I don't wanna it show lsp and long filename
  if is_in_diffmode then
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local is_v1 = string.match(bufname, "diffview:///")
    return is_v1 and filename .. " (v1)" or filename .. " (v2)"
  end

  local _, location = pcall(require("nvim-navic").get_location)
  local filename = vim.fn.fnamemodify(bufname, ":.:h")
  filename = filename ~= "." and filename or vim.fn.fnamemodify(bufname, ":t")
  local result = string.gsub(filename, "/", "  ")
  if location ~= "" then
    result = result .. "  " .. location
  end

  return result
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    disabled_filetypes = {
      winbar = {
        "neo-tree",
        "dashboard",
        "toggleterm",
        "DiffviewFiles",
        "lspsagaoutline",
        "fugitive",
        "Outline",
        "dbui",
        "",
      },
    },
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return " " .. str end } },
    lualine_b = {
      {
        'branch',
        color = { fg = "#00c65c", gui = "bold" },
        fmt = function (str)
          local end_sign = string.len(str) > 20 and '...' or ''
          return string.sub(str, 0, 20) .. end_sign;
        end
      },
      {
        'diff',
        colored = true,
        -- symbols = {added = ' ', modified = ' ', removed = ' '},
        diff_color = {
          added = { fg = '#3eff7b' },
          modified = { fg = '#ff722e' },
          removed = { fg = '#dc1616' },
        }
      },
    },
    lualine_c = {
      {
        'filetype',
        icon_only = true,
        separator = '',
        padding = { right = 0, left = 1 },
      },
      {
        'filename',
        path = 1,
        color = { fg = "#ffffff" },
        shorting_target = 30,
        fmt = function(str)
          local filetype = vim.api.nvim_buf_get_option(0, "filetype");
          if filetype == "NvimTree" or filetype == "neo-tree" then
            return "Explorer"
          end

          return str
        end
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = { error = " ", warn = "󰀪 ", hint = "󰌶 ", info = "  " }
      },
    },
    lualine_x = {
      {
        'filesize',
        fmt = function(str)
          local total_lines = vim.api.nvim_buf_line_count(0);
          return str .. "   " .. total_lines .. " lines"
        end
      },
      {
        'encoding',
        fmt = function(str)
          local fformat = vim.api.nvim_buf_get_option(0, "fileformat");
          local pre = str ~= "" and " " .. str .. "  " or ""
          return pre .. "  " .. fformat
        end
      }
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'progress', 'location' }
  },
  inactive_sections = {
    lualine_a = {
      function()
        -- vim.cmd[[hi lualine_a_inactive guibg=#16327F guifg=#541b6a gui=bold]]
        return ''
      end
    },
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_c = {
      {
        'filetype',
        icon_only = true,
        separator = '',
        padding = { right = 0, left = 1 },
      },
      winbar_fmt
    }
  },
  inactive_winbar = {
    lualine_c = {
      {
        'filetype',
        icon_only = true,
        separator = '',
        padding = { right = 0, left = 1 },
      },
      winbar_fmt
      -- {
      --   "filename",
      --   path = 0,
      --   color = { fg = "#6c6f93" },
      -- }
    }
  },
  tabline = {},
  extensions = {}
}
