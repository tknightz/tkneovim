local cb = require("diffview.config").diffview_callback

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
      ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
      ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
      ["<leader>e"] = false, -- Bring focus to the files panel
      ["<leader>b"] = false, -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
      ["o"] = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["s"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"] = cb("stage_all"), -- Stage all entries.
      ["U"] = cb("unstage_all"), -- Unstage all entries.
      ["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
      ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["<leader>e"] = false,
      ["<leader>b"] = false,
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
