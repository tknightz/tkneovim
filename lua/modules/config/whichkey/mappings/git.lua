return {

  name = "Git",

  f     = {":Telescope git_files<cr>",    "files"    },
  s     = {":Telescope git_status<cr>",   "status"   },
  S     = {":Telescope git_stash<cr>",    "stash"    },
  b     = {":Telescope git_branches<cr>", "branches" },
  c     = {":Telescope git_commits<cr>",  "commits"  },
  ["."] = {":Git<cr>",                    "Git here" },

  d = {
    name = "diff",
    o    = {":DiffviewOpen<cr>",         "open"    },
    v    = {":DiffviewOpen<cr>",         "diffview"},
    c    = {":DiffviewClose<cr>",        "close"   },
    h    = {":DiffviewFileHistory<cr>",  "history" },
    f    = {":DiffviewFileHistory<cr>",  "history" },
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
    w = {":Gitsigns blame_line<cr>",      "who code it"      },
    h = {":Gitsigns toggle_linehl<cr>",   "highlight toggle" },
    s = {":Gitsigns stage_hunk<cr>",      "stage hunk"       },
    u = {":Gitsigns undo_stage_hunk<cr>", "undo stage hunk"  },
  },

  n = {":Gitsigns next_hunk<cr>",     "next hunk"        },
  p = {":Gitsigns previous_hunk<cr>", "previous hunk"    },
}
