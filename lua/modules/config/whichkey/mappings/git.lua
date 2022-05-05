local git_util = require("lib.git")

return {

  name = "Git",

  f     = {":Telescope git_files<cr>",    "files"    },
  s     = {git_util.my_git_status,        "status"   },
  b     = {":Telescope git_branches<cr>", "branches" },
  c     = {":Git commit<cr>",             "commit"},
  ["."] = {":Git<cr>",                    "Git here" },
  w     = {":Gitsigns blame_line<cr>",    "who code it"},

  ["/"] = {
    name  = "browse",
    b     = {git_util.my_git_bcommits,      "buffer commits"},
    c     = {git_util.my_git_commits,       "commits"  },
    s     = {git_util.my_git_stash,         "stash"    },
  },

  d = {
    name = "diff",
    o    = {":DiffviewOpen<cr>",         "open"    },
    v    = {":DiffviewOpen<cr>",         "diffview"},
    c    = {":DiffviewClose<cr>",        "close"   },
    h    = {":DiffviewFileHistory<cr>",  "history" },
    f    = {":DiffviewFocusFiles<cr>",   "files" },
  },

  t = {
    name = "toggle",

    s = {":Gitsign toggle_signs<cr>",              "sign"       },
    w = {":Gitsign toggle_word_diff<cr>",          "word diff"  },
    b = {":Gitsign toggle_current_blame_line<cr>", "blame line" },
    h = {":Gitsign toggle_numhl<cr>",              "highlight"  },
  },

  h = {
    name = "hunk",

    n = {":Gitsigns next_hunk<cr>",       "next hunk"        },
    p = {":Gitsigns previous_hunk<cr>",   "previous hunk"    },
    v = {":Gitsigns preview_hunk<cr>",    "view hunk"        },
    h = {":Gitsigns toggle_linehl<cr>",   "highlight toggle" },
    s = {":Gitsigns stage_hunk<cr>",      "stage hunk"       },
    u = {":Gitsigns undo_stage_hunk<cr>", "undo stage hunk"  },
  },

  n = {":Gitsigns next_hunk<cr>",     "next hunk"        },
  p = {":Gitsigns previous_hunk<cr>", "previous hunk"    },
}
