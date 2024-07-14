local wk = require("which-key")
local session_util = require("lib.sessions")

wk.add({
  { "<leader>q", group = "quit and sessions" },
  { "<leader>qa", "<cmd>qall<cr>", desc = "quit all" },
  { "<leader>qq", "<cmd>q<cr>", desc = "quit" },
  { "<leader>qQ", "<cmd>qa!<cr>", desc = "Quit without saving" },
  { "<leader>qw", "<cmd>wqall<cr>", desc = "write changes then quit" },
  { "<leader>qs", session_util.quick_save_session, desc = "quick save current session" },
  { "<leader>qS", session_util.save_session, desc = "save current session to file" },

  { "<leader>ql", session_util.quick_load_session, desc = "restore last session" },
  { "<leader>qL", session_util.load_session, desc = "restore session from file" },
})
