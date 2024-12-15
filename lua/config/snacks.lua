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
  scope = {
    -- animate scopes. Enabled by default for Neovim >= 0.10
    -- Works on older versions but has to trigger redraws during animation.
    animate = {
      enabled = true,
      easing = "inSine",
      duration = {
        step = 20, -- ms per step
        total = 500, -- maximum duration
      },
    },
    char = "│",
    underline = true, -- underline the start of the scope
    only_current = false, -- only show scope in the current window
  },
}

require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = dashboard,
  input = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = {
    max_size = 1000,
  },
  -- indent = indent,
  indent = { enabled = false },
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
