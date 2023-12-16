local ls = require("luasnip")

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local f = ls.function_node
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.setup({
  -- delete_check_events = "TextChanged"
  region_check_events = "InsertEnter",
  delete_check_events = "InsertLeave",
})

ls.add_snippets("all", {
  s(
    "now",
    f(function()
      return os.date("%d/%m/%Y - %H:%M")
    end)
  ),
})

ls.add_snippets("python", {
  s("from", {
    t("from "),
    i(1, "name"),
    t(" import "),
    i(2, "module"),
  }),
})

ls.add_snippets("javascript", {
  s(
    "newpromise",
    fmt(
      [[
    new Promise((resolve, reject) => {{
      {1}
    }})
    ]],
      {
        i(1),
      }
    )
  ),
})

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })
