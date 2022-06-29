local db = require("dashboard");

db.custom_header = {
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
  "                _____***_____             ",
  "                My own editor!            ",
  "                                          ",
  "                                          ",
  "                                          ",
}

db.custom_center = {
  {icon = '  ',
  desc = 'Recently latest session                 ',
  shortcut = 'SPC q l',
  action ='SessionLoad'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'DashboardFindHistory',
  shortcut = 'SPC f h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Open Neovim Config                      ',
  action = 'Telescope dotfiles path=~/.config/nvim',
  shortcut = 'SPC f d'},
}

db.custom_footer = {
  '',
  ' () My power grows eternal!!!!',
}
