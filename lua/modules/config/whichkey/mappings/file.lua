return {
  name = "files",

  normal = {
    b = { ":Telescope marks<cr>",                  "Book marks"},
    f = { ":Telescope find_files hidden=true<cr>", "Find File" },
    s = { ":update<cr>",                           "Save File" },
    h = { ":Telescope oldfiles<cr>",               "History Files" },
    n = { ":new<cr>",                              "New File" },
    m = { ":Telescope media_files<cr>",            "media_files" },
    r = { ":Telescope live_grep_args<cr>",         "Grep" }
  },

  visual = {}
}
