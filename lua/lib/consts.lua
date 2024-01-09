local M = {
  sidebar_fts = {
    "fugitive",
    "aerial",
    "toggleterm",
    "Trouble",
    "qf",
    "",
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
  }
}

M.is_sidebar_ft = function(ft)
  return vim.tbl_contains(M.sidebar_fts, ft)
end

return M
