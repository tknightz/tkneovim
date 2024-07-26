local wk = require("which-key")
local git_util = require("lib.git")

local function stage_hunk()
  if vim.api.nvim_win_get_option(0, "diff") then
    vim.cmd("diffput")
  else
    vim.cmd("Gitsigns stage_hunk")
  end

  -- little hacking here cause I don't know how to back to normal mode
  vim.api.nvim_input("<esc>")
end

wk.add({
  { "<leader>g", group = "git", mode = "v,n" },

  { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "files" },
  { "<leader>gs", git_util.my_git_status, desc = "status" },
  { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "stage buffer" },
  { "<leader>gu", "<cmd>sil Git reset %<cr>", desc = "reset stage buffer " },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "branches" },
  { "<leader>gc", "<cmd>Git commit --quiet<cr>", desc = "commit" },
  { "<leader>g.", "<cmd>Git<cr>", desc = "Git here" },
  { "<leader>gw", "<cmd>Gitsigns blame_line<cr>", desc = "who code this?" },
  { "<leader>gP", "<cmd>Git push -u --quiet<cr>", desc = "Push" },
  { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "next hunk" },
  { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "previous hunk" },

  -- Git conflict mappings
  { "<leader>gx", group = "conflicts" },
  { "<leader>gxl", "<cmd>GitConflictListQf<cr>", desc = "list" },
  { "<leader>gxn", "<cmd>GitConflictNextConflict<cr>", desc = "next" },
  { "<leader>gxp", "<cmd>GitConflictPrevConflict<cr>", desc = "prev" },

  -- Git browsing/searching
  { "<leader>g/", group = "browse" },
  { "<leader>g/b", git_util.my_git_bcommits, desc = "buffer commits" },
  { "<leader>g/c", git_util.my_git_commits, desc = "commits" },
  { "<leader>g/s", git_util.my_git_stash, desc = "stash" },

  -- Git diff
  { "<leader>gd", group = "diff" },
  { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "open" },
  { "<leader>gdv", "<cmd>DiffviewOpen<cr>", desc = "diffview" },
  { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "close" },
  { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "history" },
  { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "history of current file" },

  -- Git toggle
  { "<leader>gt", group = "toggle" },
  { "<leader>gts", "<cmd>Gitsign toggle_signs<cr>", desc = "sign" },
  { "<leader>gtw", "<cmd>Gitsign toggle_word_diff<cr>", desc = "word diff" },
  { "<leader>gtb", "<cmd>Gitsign toggle_current_line_blame<cr>", desc = "blame line" },
  { "<leader>gth", "<cmd>Gitsign toggle_linehl<cr>", desc = "highlight" },

  -- Git hunks
  { "<leader>gh", group = "hunks" },
  { "<leader>ghn", "<cmd>Gitsigns next_hunk<cr>", desc = "next hunk" },
  { "<leader>ghp", "<cmd>Gitsigns previous_hunk<cr>", desc = "previous hunk" },
  { "<leader>ghv", "<cmd>Gitsigns preview_hunk<cr>", desc = "view hunk" },
  { "<leader>ghh", "<cmd>Gitsigns toggle_linehl<cr>", desc = "highlight toggle" },
  { "<leader>ghs", stage_hunk, desc = "stage hunk" },
  { "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "undo stage hunk" },

  -- Git rebase
  { "<leader>gr", group = "rebase" },
  { "<leader>grc", "<cmd>Git rebase --continue<cr>", desc = "continue" },
  { "<leader>gra", "<cmd>Git rebase --abort<cr>", desc = "abort" },

  -- Visual mode
  { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "stage hunk", mode = "v" },
  { "<leader>gS", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "undo_stage_hunk", mode = "v" },
  { "<leader>gu", ":Gitsigns reset_hunk<CR>", desc = "reset_hunk", mode = "v" },
})
