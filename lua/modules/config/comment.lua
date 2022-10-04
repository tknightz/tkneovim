local comment = require("Comment")
local ft = require("Comment.ft");
local api = require("Comment.api");

comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = 'gcc',
    ---Block-comment toggle keymap
    block = 'gbc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = 'gc',
    ---Block-comment keymap
    block = 'gb',
  },

  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
    ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
    extended = true,
  },
})

-- Override Ctrl+/ to comment
vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, {});
vim.keymap.set("v", "<C-_>", api.call("toggle.blockwise", "g@"), { expr = true });

-- Set comment for some nondefault support filetypes
ft
 .set("yaml", "#%s")
