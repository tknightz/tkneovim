local cb = require("diffview.config").diffview_callback
local actions = require("diffview.actions")

require("diffview").setup({
  diff_binaries = false, -- Show diffs for binaries
  use_icons = true, -- Requires nvim-web-devicons
  view = {
    merge_tool = {
      layout = "diff3_mixed",
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
    }
  },
  file_panel = {
    win_config = {
      position = "left", -- One of 'left', 'right', 'top', 'bottom'
      width = 35, -- Only applies when position is 'left' or 'right'
      height = 10, -- Only applies when position is 'top' or 'bottom'
    },
  },
  keymaps = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "<leader>e", false },
      { "n", "<Space>e", false },
    },
    file_panel = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "t",         actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },
      { "n", "<leader>e", false },
      { "n", "<Space>e", false },
    },
    panel = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "<leader>e", false },
      { "n", "<Space>e", false },
    },
    file_history_panel = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "<leader>e", false },
      { "n", "<Space>e", false },
    },
  },
})
