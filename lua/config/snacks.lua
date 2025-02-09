local is_special_ft = require("lib.consts").is_special_ft

local dashboard = {
  enabled = true,
  autokeys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  preset = {
    -- Used by the `header` section
    header = [[
████████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
╚══██╔══╝██║ ██╔╝██║   ██║██║████╗ ████║
   ██║   █████╔╝ ██║   ██║██║██╔████╔██║
   ██║   ██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║   ██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
              ______***______           
              Weapon of Gods!           
      ]],
  },
  sections = {
    { section = "header" },
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
    { section = "startup" },
  },
}

local indent = {
  animate = {
    enabled = true,
    easing = "inSine",
  },
  scope = {
    enabled = true,
    char = "│",
    underline = true, -- underline the start of the scope
    only_current = true, -- only show scope in the current window
  },
  chunk = {
    enabled = true,
    char = {
      corner_top = "╭",
      corner_bottom = "╰",
      horizontal = "─",
      vertical = "│",
      arrow = ">",
    },
  },
}

local picker = {
  enabled = true,
  ui_select = true,
  -- layout = {
  --   preset = "ivy",
  -- },
  formatters = {
    text = {
      ft = nil, ---@type string? filetype for highlighting
    },
    file = {
      -- filename_first = true, -- display filename before the file path
      truncate = 80, -- truncate the file path to (roughly) this length
      filename_only = false, -- only show the filename
    },
    selected = {
      show_always = false, -- only show the selected column when there are multiple selections
      unselected = true, -- use the unselected icon for unselected items
    },
  },

  -- Keymaps
  win = {
    -- input window
    input = {
      keys = {
        ["<Esc>"] = { "close", mode = { "n", "i" } },
        ["<c-l>"] = { "qflist", mode = { "i", "n" } },
        ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
        ["<c-d>"] = { "preview_scroll_up", mode = { "i", "n" } },
      },
    },
  },

  -- previewers
  previewers = {
    git = {
      native = true,
    },
  },

  -- jump
  jump = {
    reuse_win = false,
  },

  -- Sources config
  sources = {
    files = {
      layout = {
        preview = false,
        preset = "ivy",
      },
    },
    spelling = {
      layout = {
        preset = "select",
      },
    },
  },

  layouts = {
    select = {
      layout = {
        relative = "cursor",
        width = 30,
        min_width = 0,
        row = -3,
        col = 0,
        height =  6,
      },
    },
  },
}

require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = dashboard,
  input = {
    enabled = true,
  },
  styles = {
    input = {
      relative = "cursor",
      row = -3,
      col = 0,
      width = 30,
    }
  },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  picker = picker,
  indent = indent,

  scope = {
    enabled = true,
  },
  scroll = {
    enabled = true,
    filter = function(buf)
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
      return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and is_special_ft(filetype) == false
    end,
  },
  statuscolumn = {
    enabled = false,
    left = { "fold", "mark", "sign" }, -- priority of signs on the left (high to low)
    right = { "git" }, -- priority of signs on the right (high to low)
    folds = {
      open = true,
      -- open = false, -- show open fold icons
      -- git_hl = false, -- use Git Signs hl for fold icons
    },
    git = {
      -- patterns to match Git signs
      patterns = { "GitSign", "MiniDiffSign" },
    },
    refresh = 50, -- refresh at most every 50ms
  },
  words = { enabled = false },
})

-- override builtin-print
print = function(...)
  local print_safe_args = {}
  local _ = { ... }
  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  vim.notify(table.concat(print_safe_args, " "), "info")
end
