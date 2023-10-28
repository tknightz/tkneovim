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


local normal = {
  f = { ":Telescope git_files<cr>", "files" },
  s = { git_util.my_git_status, "status" },
  S = { ":Gitsigns stage_buffer<cr>", "stage buffer" },
  u = { ":sil Git reset %<cr>", "reset stage buffer "},
  b = { ":Telescope git_branches<cr>", "branches" },
  c = { ":Git commit --quiet<cr>", "commit" },
  ["."] = { ":Git<cr>", "Git here" },
  w = { ":Gitsigns blame_line<cr>", "who code it" },
  P = { ":Git push -u --quiet<cr>", "Push" },
  n = { ":Gitsigns next_hunk<cr>", "next hunk" },
  p = { ":Gitsigns prev_hunk<cr>", "previous hunk" },

  ["/"] = {
    name = "browse",
    b = { git_util.my_git_bcommits, "buffer commits" },
    c = { git_util.my_git_commits, "commits" },
    s = { git_util.my_git_stash, "stash" },
  },

  d = {
    name = "diff",
    o = { ":DiffviewOpen<cr>", "open" },
    v = { ":DiffviewOpen<cr>", "diffview" },
    c = { ":DiffviewClose<cr>", "close" },
    h = { ":DiffviewFileHistory<cr>", "history" },
    f = { ":DiffviewFileHistory %<cr>", "history of current file" },
  },

  t = {
    name = "toggle",

    s = { ":Gitsign toggle_signs<cr>", "sign" },
    w = { ":Gitsign toggle_word_diff<cr>", "word diff" },
    b = { ":Gitsign toggle_current_blame_line<cr>", "blame line" },
    h = { ":Gitsign toggle_numhl<cr>", "highlight" },
  },

  h = {
    name = "hunk",

    n = { ":Gitsigns next_hunk<cr>", "next hunk" },
    p = { ":Gitsigns previous_hunk<cr>", "previous hunk" },
    v = { ":Gitsigns preview_hunk<cr>", "view hunk" },
    h = { ":Gitsigns toggle_linehl<cr>", "highlight toggle" },
    s = { stage_hunk, "stage hunk" },
    u = { ":Gitsigns undo_stage_hunk<cr>", "undo stage hunk" },
  },
}

local visual = {
  s = { ":Gitsigns stage_hunk<CR>", "stage hunk" },
  u = { ":Gitsigns undo_stage_hunk<CR>", "undo_stage_hunk" }
}

return {
  name = "git",
  normal = normal,
  visual = visual
}
