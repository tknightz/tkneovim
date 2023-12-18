local special_fts = require("lib.consts").special_fts

require("ibl").setup({
  indent = { highlight = { "IndentBlanklineChar" }, char = "│" },
  -- scope = { highlight = highlight },
  scope = { enabled = false },
  exclude = {
    filetypes = special_fts,
  },
})
