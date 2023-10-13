-- require('indent_blankline').setup {
--   use_treesitter = false,
--   show_end_of_line = false,
--   filetype_exclude = {
--     "help",
--     "mason",
--     "packer",
--     "txt",
--     "alpha",
--     "dashboard",
--     "nofile",
--     "prompt",
--     "TelescopePrompt",
--     "DiffviewFiles",
--     "fugitive",
--     "qf",
--     "",
--     "dbout",
--     "neo-tree",
--     "Outline",
--   },
--   buftype_exclude = {'terminal', 'packer'},
--   term = 238,
--   gui = '#1E272C',
--   -- char_list = {'|', '¦', '┆', '┊'},
--   char_list = {'│'},
--   context_char = "│",
--   concealcursor = 'inc',
--   conceallevel = 2,
--   context_patterns = {'class', 'function', 'def', 'method', 'if', 'for', 'while', 'block'},
--   space_char_blankline = ' ',
--
--   show_trailing_blankline_indent = false,
--   show_current_context = false,
--
--   char_highlight_list = {
--     'IndentBlanklineChar'
--   },
--   space_char_highlight_list = {
--     'IndentBlanklineChar'
--   },
-- }

-- local highlight = {
--   "IndentBlanklineChar",
--   "Whitespace",
-- }
-- require("ibl").setup {
--   indent = { highlight = highlight, char = "│" },
--   whitespace = {
--     highlight = highlight,
--     remove_blankline_trail = false,
--   },
--   scope = { enabled = true },
-- }

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup {
  indent = { highlight = {"IndentBlanklineChar"}, char = "│" },
  -- scope = { highlight = highlight },
  scope = { enabled = false },
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
