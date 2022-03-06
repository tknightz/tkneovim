local keymaps = {
  normal = {
    ["<Leader>h"]   = {
      to    = ":set hlsearch!<CR>",
      opt   = {}
    },

    ["<C-_>"]       = ":lua require('Comment.api').toggle_current_linewise()<cr>",
    ["<C-y>"]       = ":%y+",

    ["<C-S-Left>"]  = ":vertical resize +3<cr>",
    ["<C-S-Right>"] = ":vertical resize -3<cr>",
    ["<C-S-Up>"]    = ":resize +3<cr>",
    ["<C-S-Down>"]  = ":resize -3<cr>",

    ["<Esc>"]       = "<C-\\><C-n>",
  },

  visual_select = {
    ["<C-y>"] = ":%y+",
    ["<C-_>"] = ":lua require('Comment.api').toggle_blockwise_op('V', {})<cr>",
  },

  visual_only = {
    ["("]  = "<Plug>(operator-sandwich-add))",
    ["["]  = "<Plug>(operator-sandwich-add)]",
    ["{"]  = "<Plug>(operator-sandwich-add)}",
    [")"]  = "<Plug>(operator-sandwich-add))",
    ["]"]  = "<Plug>(operator-sandwich-add)]",
    ["}"]  = "<Plug>(operator-sandwich-add)}",
    ["'"]  = "<Plug>(operator-sandwich-add)'",
    ["\""] = "<Plug>(operator-sandwich-add)\""
  },

  insert = {
    ["<S-Up>"] = {
      to = "<Esc>:m-2<CR>",
      opt ={ noremap = true }
    },

    ["<S-Down>"] = {
      to = "<Esc>:m+<CR>",
      opt = { noremap = true }
    }
  },

  terminal = {
    ["<Esc>"] = "<C-\\><C-n>",
  }
}

local name_conversion = {
  normal = "n",
  visual_select = "v",
  visual_only = "x",
  select_only = "s",
  insert = "i",
  command = "c",
  terminal = "t",
}

function setup_keymap()
  for mode, mappings in pairs(keymaps) do
    local named_mode = name_conversion[mode]
    for key, map in pairs(mappings) do
      local map_to = type(map) == "table" and map.to or map
      local opt = type(map) == "table" and map.opt or {}
      vim.api.nvim_set_keymap(named_mode, key, map_to, opt)
      end
  end
end

setup_keymap()
