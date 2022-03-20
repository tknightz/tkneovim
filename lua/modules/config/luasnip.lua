local ls = require("luasnip")

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require("luasnip.extras.fmt").fmt


local f = ls.function_node

ls.snippets = {
  all = {
    s("now", f(function() return os.date "%d/%m/%Y - %H:%M" end))
  },

  python = {
    s("from", {
      t("from "), i(1, "name"), t(" import "), i(2, "module")
    })
  }
}
