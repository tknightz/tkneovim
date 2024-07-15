local wk = require("which-key")

local function visual_grep()
  local _, tls = pcall(require, "telescope.builtin")

  return tls.grep_string({
    word_match = true,
    only_sort_text = true,
  })
end

wk.add({
  { "<leader>s", group = "search", mode = "v,n" },
  { "<leader>ss", ":Telescope<cr>", desc = "searcher" },
  { "<leader>sf", ":Telescope find_files<cr>", desc = "file" },
  { "<leader>sm", ":Telescope media_files<cr>", desc = "media_files" },
  { "<leader>sr", ":Telescope live_grep<cr>", desc = "grep" },
  { "<leader>sb", ":Telescope buffers<cr>", desc = "buffers" },
  { "<leader>so", ":Telescope oldfiles<cr>", desc = "oldfiles" },
  { "<leader>sp", ":Telescope projects<cr>", desc = "project" },
  { "<leader>se", ":Telescope symbols<cr>", desc = "emoji" },
  { "<leader>s.", ":Telescope current_buffer_fuzzy_find<cr>", desc = "current_buffer" },
  { "<leader>s/", ":Telescope<cr>", desc = "overview" },

  { "<leader>sl", group = "lsp" },
  { "<leader>sla", ":Telescope lsp_code_actions<cr>", desc = "actions" },
  { "<leader>sld", ":Telescope lsp_definitions<cr>", desc = "definitions" },
  { "<leader>slr", ":Telescope lsp_references<cr>", desc = "references" },

  -- History
  { "<leader>sh", group = "history" },
  { "<leader>shs", ":Telescope search_history<cr>", desc = "search" },
  { "<leader>shc", ":Telescope command_history<cr>", desc = "command" },

  { "<leader>st", group = "tag" },
  { "<leader>sth", ":Telescope help_tags<cr>", desc = "help" },
  { "<leader>st.", ":Telescope current_buffer_tags<cr>", desc = "current_buffer" },

  { "<leader>sw", ":Telescope grep_string<CR>", desc = "word" },

  { "<leader>sr", visual_grep, desc = "grep_vi", mode = "v" },
  { "<leader>sw", ":Telescope grep_string<CR>", desc = "word", mode = "v" },
})
