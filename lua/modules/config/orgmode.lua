require("lib").load_module("treesitter")

-- Load custom tree-sitter grammar for org filetype
local orgmode = require("orgmode")
orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = {"~/notes/agenda.org"},
  org_default_notes_file = "~/notes/*.org"
})
