local M = {
  sidebar_fts = {
    "fugitive",
    "aerial",
    "Outline",
    "toggleterm",
    "Trouble",
    "qf",
    "dbee-drawer",
    "dbee-result",
    "dbee-call-log",
  },

  special_fts = {
    "TelescopePrompt",
    "prompt",
    "dashboard",
    "NvimTree",
    "dirvish",
    "fugitive",
    "gitcommit",
    "neo-tree",
    "DiffviewFiles",
    "DiffviewFileHistory",
    "aerial",
    "dbui",
    "sagaoutline",
    "Outline",
    "dbui",
    "dbout",
    "qf",
    "Trouble",
    "toggleterm",
    "dbee-drawer",
    "dbee-result",
    "dbee-call-log",
  }
}

M.is_sidebar_ft = function(ft)
  return vim.tbl_contains(M.sidebar_fts, ft)
end

return M
