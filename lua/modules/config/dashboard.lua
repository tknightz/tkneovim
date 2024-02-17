local db = require("dashboard")

db.setup({
  config = {
    disable_move = true,
    project = { limit = 4, icon = " ", label = "Project", action = "Telescope find_files cwd=" },
    shortcut = {
      { desc = "󰏕 Modules Update", group = "DashboardShortCut", action = "Lazy update", key = "p" },
      { desc = " TS Update", group = "DashboardShortCut", action = "TSUpdate", key = "t" },
      { desc = " Startuptime", group = "DashboardShortCut", action = "Lazy profile", key = "s" },
      { desc = " Newfile", group = "DashboardShortCut", action = "enew", key = "n" },
    },
    packages = { enable = false },
    header = {
      "                                          ",
      "                                          ",
      "                                          ",
      "                                          ",
      " ████████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗ ",
      " ╚══██╔══╝██║ ██╔╝██║   ██║██║████╗ ████║ ",
      "    ██║   █████╔╝ ██║   ██║██║██╔████╔██║ ",
      "    ██║   ██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "    ██║   ██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "    ╚═╝   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "               ______***______            ",
      "               Weapon of Gods!            ",
      "                                          ",
      "                                          ",
    },
    center = {
      {
        icon = "  ",
        desc = "Recently latest session                 ",
        shortcut = "SPC q l",
        action = "SessionLoad",
      },
      {
        icon = "  ",
        desc = "Recently opened files                   ",
        action = "DashboardFindHistory",
        shortcut = "SPC f h",
      },
      {
        icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files",
        shortcut = "SPC f f",
      },
      {
        icon = "  ",
        desc = "File Browser                            ",
        action = "Telescope file_browser",
        shortcut = "SPC f b",
      },
      {
        icon = "  ",
        desc = "Find  word                              ",
        action = "Telescope live_grep",
        shortcut = "SPC f w",
      },
      {
        icon = "  ",
        desc = "Open Neovim Config                      ",
        action = "Telescope dotfiles path=~/.config/nvim",
        shortcut = "SPC f d",
      },
    },
    footer = {
      "",
      " 󰈸 My power grows eternal!!!! 󰈸 ",
    },
  },
})
