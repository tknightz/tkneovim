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
  { "<leader>g", group = "git" },

  { "<leader>gf", ":Telescope git_files<cr>", desc = "files" },
  { "<leader>gs", git_util.my_git_status, desc = "status" },
  { "<leader>gS", ":Gitsigns stage_buffer<cr>", desc = "stage buffer" },
  { "<leader>gu", ":sil Git reset %<cr>", desc = "reset stage buffer " },
  { "<leader>gb", ":Telescope git_branches<cr>", desc = "branches" },
  { "<leader>gc", ":Git commit --quiet<cr>", desc = "commit" },
  { "<leader>g.", ":Git<cr>", desc = "Git here" },
  { "<leader>gw", ":Gitsigns blame_line<cr>", desc = "who code this?" },
  { "<leader>gP", ":Git push -u --quiet<cr>", desc = "Push" },
  { "<leader>gn", ":Gitsigns next_hunk<cr>", desc = "next hunk" },
  { "<leader>gp", ":Gitsigns prev_hunk<cr>", desc = "previous hunk" },

  -- Git conflict mappings
  { "<leader>gx", group = "conflicts" },
  { "<leader>gxl", ":GitConflictListQf<cr>", desc = "list" },
  { "<leader>gxn", ":GitConflictNextConflict<cr>", desc = "next" },
  { "<leader>gxp", ":GitConflictPrevConflict<cr>", desc = "prev" },

  -- Git browsing/searching
  { "<leader>g/", group = "browse" },
  { "<leader>g/b", git_util.my_git_bcommits, desc = "buffer commits" },
  { "<leader>g/c", git_util.my_git_commits, desc = "commits" },
  { "<leader>g/s", git_util.my_git_stash, desc = "stash" },

  -- Git diff
  { "<leader>gd", group = "diff" },
  { "<leader>gdo", ":DiffviewOpen<cr>", desc = "open" },
  { "<leader>gdv", ":DiffviewOpen<cr>", desc = "diffview" },
  { "<leader>gdc", ":DiffviewClose<cr>", desc = "close" },
  { "<leader>gdh", ":DiffviewFileHistory<cr>", desc = "history" },
  { "<leader>gdf", ":DiffviewFileHistory %<cr>", desc = "history of current file" },

  -- Git toggle
  { "<leader>gt", group = "toggle" },
  { "<leader>gts", ":Gitsign toggle_signs<cr>", desc = "sign" },
  { "<leader>gtw", ":Gitsign toggle_word_diff<cr>", desc = "word diff" },
  { "<leader>gtb", ":Gitsign toggle_current_line_blame<cr>", desc = "blame line" },
  { "<leader>gth", ":Gitsign toggle_linehl<cr>", desc = "highlight" },

  -- Git hunks
  { "<leader>gh", group = "hunks" },
  { "<leader>ghn", ":Gitsigns next_hunk<cr>", desc = "next hunk" },
  { "<leader>ghp", ":Gitsigns previous_hunk<cr>", desc = "previous hunk" },
  { "<leader>ghv", ":Gitsigns preview_hunk<cr>", desc = "view hunk" },
  { "<leader>ghh", ":Gitsigns toggle_linehl<cr>", desc = "highlight toggle" },
  { "<leader>ghs", stage_hunk, desc = "stage hunk" },
  { "<leader>ghu", ":Gitsigns undo_stage_hunk<cr>", desc = "undo stage hunk" },

  -- Git rebase
  { "<leader>gr", group = "rebase" },
  { "<leader>grc", ":Git rebase --continue<cr>", desc = "continue" },
  { "<leader>gra", ":Git rebase --abort<cr>", desc = "abort" },

  -- Visual mode
  { "<leader>gs", ":Gitsigns stage_hunk<CR>", desc = "stage hunk", mode = "v" },
  { "<leader>gS", ":Gitsigns undo_stage_hunk<CR>", desc = "undo_stage_hunk", mode = "v" },
  { "<leader>gu", ":Gitsigns reset_hunk<CR>", desc = "reset_hunk", mode = "v" },
})
