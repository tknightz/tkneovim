local cb = require("diffview.config").diffview_callback
local actions = require("diffview.actions")

require("diffview").setup({
  diff_binaries = false, -- Show diffs for binaries
  use_icons = true, -- Requires nvim-web-devicons
  file_panel = {
    win_config = {
      position = "left", -- One of 'left', 'right', 'top', 'bottom'
      width = 35, -- Only applies when position is 'left' or 'right'
      height = 10, -- Only applies when position is 'top' or 'bottom'
    },
  },
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "<leader>e", false },
    },
    file_panel = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "t",         actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },
      { "n", "<leader>e", false },
    },
    panel = {
      { "n", "<leader>n", actions.toggle_files,  { desc = "Toggle to the file panel" } },
      { "n", "<leader>e", false },
    },
    file_history_panel = {
      { "n", "<leader>e", false },
    },
  },
  --[[
  hooks = {
    view_opened = function(view)
      local DiffView = require("diffview.views.diff.diff_view").DiffView
      if view:instanceof(DiffView) then
        -- Refresh diffview when the git index changes:
        local watcher = vim.loop.new_fs_poll()
        watcher:start(view.git_dir .. "/index", 1000, function(err, prev, cur)
          if not err then
            vim.schedule(function()
              vim.cmd("DiffviewRefresh")
            end)
          end
        end)

        -- Stop the watcher when the view closes:
        DiffviewGlobal.emitter:on("view_closed", function(v)
          if v == view then
            watcher:stop()
          end
        end)
      end
    end,
  },]]
})
