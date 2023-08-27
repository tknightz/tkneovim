require('indent_blankline').setup {
  use_treesitter = false,
  show_end_of_line = false,
  filetype_exclude = {
    "help",
    "mason",
    "packer",
    "txt",
    "alpha",
    "dashboard",
    "nofile",
    "prompt",
    "TelescopePrompt",
    "DiffviewFiles",
    "fugitive",
    "qf",
    "",
    "dbout",
    "neo-tree",
    "Outline",
  },
  buftype_exclude = {'terminal', 'packer'},
  term = 238,
  gui = '#1E272C',
  -- char_list = {'|', '¦', '┆', '┊'},
  char_list = {'│'},
  context_char = "│",
  concealcursor = 'inc',
  conceallevel = 2,
  context_patterns = {'class', 'function', 'def', 'method', 'if', 'for', 'while', 'block'},
  space_char_blankline = ' ',

  show_trailing_blankline_indent = false,
  show_current_context = false,

  char_highlight_list = {
    'IndentBlanklineChar'
  },
  space_char_highlight_list = {
    'IndentBlanklineChar'
  },
}
