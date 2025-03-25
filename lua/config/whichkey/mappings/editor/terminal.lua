local wk = require("which-key")

local function toggle_scroll()
  if Snacks.scroll.enabled then
    Snacks.scroll.disable()
  else
    Snacks.scroll.enable()
  end
end

wk.add({
  { "<leader>t", group = "terminal/toggle" },
  { "<leader>tn", "<cmd>ToggleTerm<cr>", desc = "new" },
  { "<leader>tl", "<cmd>lopen<cr>", desc = "loclist" },
  { "<leader>tq", "<cmd>copen<cr>", desc = "quickfix" },
  { "<leader>ts", toggle_scroll, desc = "scroll" },
})
