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
  }
}

require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = dashboard,
  input = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = {
    enabled = true,
  },
  indent = indent,
  scroll = { enabled = true },
  statuscolumn = { enabled = false },
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
