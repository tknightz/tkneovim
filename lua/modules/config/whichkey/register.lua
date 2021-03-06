local wk = require('which-key')
local mappings = require("modules.config.whichkey.mappings")

wk.register({
  f = mappings.file,

  w = mappings.editor.window,

  g = mappings.git,

  b = mappings.editor.buffer,

  m = mappings.modules,

  t = mappings.editor.terminal,

  e = mappings.editor.editing,

  s = mappings.searcher,

  l = mappings.lsp,

  q = mappings.editor.quit_and_sessions,

  -- global mappings
  j = {"<cmd>WindowJumping<cr>",   "jump"},

  y = {"<cmd>%y+<cr>",            "yank to clipboard"},

  n = {"<cmd>NvimTreeToggle<cr>", "neotree" },

},
{
  prefix = "<Leader>",
  mode = "n"
})


wk.register({
  f = mappings.file,

  w = mappings.editor.window,

  g = mappings.git,

  b = mappings.editor.buffer,

  m = mappings.modules,

  t = mappings.editor.terminal,

  e = mappings.editor.editing,

  s = mappings.searcher,

  l = mappings.lsp,

  q = mappings.editor.quit_and_sessions,

  -- global mappings
  j = {"<cmd>WindowJumping<cr>",   "jump"},

  y = {"<cmd>%y+<cr>",            "yank to clipboard"},

  n = {"<cmd>NvimTreeToggle<cr>", "nvimtree" },

},
{
  prefix = "<Leader>",
  mode = "v"
})
