local wk = require("which-key")
local snack_search_fn = require("lib").snack_search_fn

local function visual_grep()
  local _, tls = pcall(require, "telescope.builtin")

  return tls.grep_string({
    word_match = true,
    only_sort_text = true,
  })
end

wk.add({
  { "<leader>s", group = "search", mode = { "n", "v" } },
  { "<leader>,", snack_search_fn("buffers"), desc = "Buffers" },
  { "<leader>sp", snack_search_fn("projects"), desc = "Projects" },
  { "<leader>sn", ":lua Snacks.notifier.show_history()<cr>", desc = "notifications" },

  { "<leader>sl", group = "lsp" },

  -- History
  { "<leader>:", snack_search_fn("command_history"), desc = "Command History", },

  { "<leader>st", group = "tag" },
  {
    "<leader>sw",
    snack_search_fn("grep_word"),
    desc = "Visual selection or word",
    mode = { "n", "x" },
  },
  { '<leader>s"', snack_search_fn("registers"), desc = "Registers" },
  { "<leader>sa", snack_search_fn("autocmds"), desc = "Autocmds" },
  { "<leader>sC", snack_search_fn("commands"), desc = "Commands" },
  { "<leader>sd", snack_search_fn("diagnostics"), desc = "Diagnostics" },
  { "<leader>sH", snack_search_fn("highlights"), desc = "Highlights" },
  { "<leader>sj", snack_search_fn("jumps"), desc = "Jumps" },
  { "<leader>sk", snack_search_fn("keymaps"), desc = "Keymaps" },
  { "<leader>sl", snack_search_fn("loclist"), desc = "Location List" },
  { "<leader>sM", snack_search_fn("man"), desc = "Man Pages" },

  -- { "<leader>sr", visual_grep, desc = "grep_vi", mode = "v" },
  { "<leader>sB", snack_search_fn("grep_buffers"), desc = "Grep Open Buffers" },
})
