local build_keymaps = require("lib").build_keymaps

require("nvim-treesitter-textobjects").setup({
  select = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = false,
  },
})

local function create_textobject_keymap(key, textobject, desc)
  return {
    key,
    function()
      require("nvim-treesitter-textobjects.select").select_textobject(textobject, "textobjects")
    end,
    desc = desc,
    mode = { "x", "o" },
  }
end

local keymaps = {
  create_textobject_keymap("af", "@function.outer", "Select around function"),
  create_textobject_keymap("if", "@function.inner", "Select inside function"),
  create_textobject_keymap("ac", "@class.outer", "Select around class"),
  create_textobject_keymap("ic", "@class.inner", "Select inside class"),
  create_textobject_keymap("a/", "@comment.outer", "Select around comment"),
  create_textobject_keymap("i/", "@comment.inner", "Select inside comment"),
  {
    "<leader>a",
    function()
      require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
    end,
    desc = "Swap parameter",
    mode = "n",
  },
  {
    "<leader>A",
    function()
      require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
    end,
    desc = "Swap outer parameter",
    mode = "n",
  },
}

local bufnr = nil
build_keymaps(bufnr, keymaps)
