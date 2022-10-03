local function shorten_str(str, size)
  local len = size and size or 27

  local strlen = string.len(str)
  if string.len(str) == 0 then
    return '_blank'
  end
  if string.len(str) < len then
    return str
  end

  local head = string.sub(str, 0, math.floor(len/2))
  local tail = string.sub(str, strlen - math.floor(len/2), strlen)

  return head .. '...' .. tail
end

local function shorten_bufname()
  local path = vim.api.nvim_buf_get_name(0)
  local filename = vim.api.nvim_call_function('fnamemodify', {path, ':t'})
  local ext = vim.api.nvim_call_function('fnamemodify', {path, ':e'})
  local icon = require('nvim-web-devicons').get_icon(filename, ext, { default = true })

  local is_modified = vim.bo.modified

  local modified_indicator = is_modified and "" or ""
  return icon .. " " .. shorten_str(filename) .. " " .. modified_indicator
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { {'mode', fmt = function(str) return " "..str end} },
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
        padding={ right=0, left=1 },
      },
      {
        'filename',
        path = 1,
        color = { fg = "#ffffff" },
        fmt = function(str)
          local filetype = vim.api.nvim_buf_get_option(0, "filetype");
          if filetype == "NvimTree" then
            return ""
          end

          return str
        end
      },
      {
        "diagnostics",
        sources = {"nvim_diagnostic"},
        sections = {'error', 'warn', 'info'},
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
    lualine_y = {'filetype'},
    lualine_z = {'progress', 'location'}
  },
  inactive_sections = {
    lualine_a = {
      function()
        -- vim.cmd[[hi lualine_a_inactive guibg=#16327F guifg=#541b6a gui=bold]]
        return ''
      end
    },
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
