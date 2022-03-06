local session_util = require("lib.sessions")

return {
  name = "quit/sessions",

  a = {"<cmd>qall<cr>", "quit all"},
  q = {"<cmd>q<cr>", "quit"},
  Q = {"<cmd>qa!<cr>", "Quit without saving"},
  w = {"<cmd>wqall<cr>", "write changes then quit"},
  s = {session_util.quick_save_session, "quick save current session"},
  S = {session_util.save_session, "save current session to file"},

  l = {session_util.quick_load_session, "restore last session"},
  L = {session_util.load_session, "restore session from file"},
}
