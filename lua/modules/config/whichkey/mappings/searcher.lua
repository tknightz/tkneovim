local function visual_grep()
  local _, tls = pcall(require, "telescope.builtin")

  return tls.grep_string({
    word_match = true,
    only_sort_text = true,
  })
end

return {
  name = "search",

  normal = {
    s = { ":Telescope<cr>", "searcher" },
    f = { ":Telescope find_files<cr>", "file" },
    m = { ":Telescope media_files<cr>", "media_files" },
    r = { ":Telescope live_grep<cr>", "grep" },
    ["."] = { ":Telescope current_buffer_fuzzy_find<cr>", "current_buffer" },
    b = { ":Telescope buffers<cr>", "buffers" },
    o = { ":Telescope oldfiles<cr>", "oldfiles" },
    p = { ":Telescope projects<cr>", "project" },
    e = { ":Telescope symbols<cr>", "emoji" },
    ["/"] = { ":Telescope<cr>", "overview" },

    l = {
      name = "LSP",
      a = { ":Telescope lsp_code_actions<cr>", "actions" },
      d = { ":Telescope lsp_definitions<cr>", "definitions" },
      r = { ":Telescope lsp_references<cr>", "references" },
    },

    h = {
      name = "History",
      s = { ":Telescope search_history<cr>", "search" },
      c = { ":Telescope command_history<cr>", "command" },
    },

    t = {
      name = "Tag",
      h = { ":Telescope help_tags<cr>", "help" },
      ["."] = { ":Telescope current_buffer_tags<cr>", "current_buffer" },
    },

    w = { ":Telescope grep_string<CR>", "word" },
  },

  visual = {
    r = { visual_grep, "grep_vi" },
    w = { ":Telescope grep_string<CR>", "word" },
  },
}
