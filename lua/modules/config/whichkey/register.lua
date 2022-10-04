local wk = require('which-key')
local mappings = require("modules.config.whichkey.mappings")

local base_mappings = {
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
  p = mappings.project,
}

wk.register(vim.tbl_deep_extend("keep", base_mappings, {
  -- not a group mappings
  j = { "<cmd>WindowJumping<cr>", "jump" },
  y = { "<cmd>%y+<cr>", "yank to clipboard" },
  n = { "<cmd>NvimTreeToggle<cr>", "neotree" },
}),
  {
    prefix = "<Leader>",
    mode = "n"
  })


wk.register(vim.tbl_deep_extend("keep", base_mappings, {
  -- not a group mappings
  j = { "<cmd>WindowJumping<cr>", "jump" },
  y = { "<cmd>%y+<cr>", "yank to clipboard" },
  n = { "<cmd>NvimTreeToggle<cr>", "nvimtree" },
}),
  {
    prefix = "<Leader>",
    mode = "v"
  })
