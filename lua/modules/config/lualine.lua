local _, navic = pcall(require, "nvim-navic")

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
      },
    },
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return " " .. str end } },
    lualine_b = {
      {
        'branch',
        color = { fg = "#00c65c", gui = "bold" },
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
        sections = { 'error', 'warn', 'info' },
        symbols = { error = " ", warning = " ", hint = "", info = " " }
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
    lualine_b = {
      { "filetype", icon_only = true, separator = "" },
      { "filename", path = 0 },
    },
    lualine_c = { navic.get_location }
  },
  inactive_winbar = {
    lualine_b = {
      { "filetype", icon_only = true, separator = "" },
      { "filename", path = 0 },
    }
  },
  tabline = {},
  extensions = {}
}
