local wk = require("which-key")
local snack_search_fn = require("lib").snack_search_fn

wk.add({
  { "<leader>f", group = "files" },
  { "<leader>fb", snack_search_fn("marks"), desc = "Marks" },
  { "<leader>ff", snack_search_fn("files", { hidden = true }), desc = "Find Files" },
  { "<leader>fs", "<cmd>update<cr>", desc = "Save File" },
  { "<leader>fh", snack_search_fn("command_history"), desc = "Command History" },
  { "<leader>fn", "<cmd>new<cr>", desc = "New File" },
  { "<leader>fr", snack_search_fn("grep"), desc = "Grep" },
  {
    "<leader>fc",
    function()
      Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
    end,
    desc = "Find Config File",
  },
})
