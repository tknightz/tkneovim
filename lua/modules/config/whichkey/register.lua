local wk = require('which-key')
local mappings = require("modules.config.whichkey.mappings")

function jump_to_window()
  local window = require('window-picker').pick_window()
  if window ~= nil then
    vim.api.nvim_set_current_win(window)
  end
end

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
  j = { jump_to_window, "jump" },
  y = { "<cmd>%y+<cr>", "yank to clipboard" },
  n = { "<cmd>NeoTreeRevealToggle<cr>", "neotree" },
}),
  {
    prefix = "<Leader>",
    mode = "n"
  })


wk.register(vim.tbl_deep_extend("keep", base_mappings, {
  -- not a group mappings
  j = { jump_to_window, "jump" },
  y = { "<cmd>%y+<cr>", "yank to clipboard" },
  n = { "<cmd>NeoTreeRevealToggle<cr>", "neotree" },
}),
  {
    prefix = "<Leader>",
    mode = "v"
  })
