local keymaps = {
  normal = {
    ["<Leader>h"] = {
      to          = ":set hlsearch!<CR>",
      opt         = {}
    },
    ["gz"]        = "<Plug>Lightspeed_s",
    ["gZ"]        = "<Plug>Lightspeed_S",

    ["<C-_>"]     = ":lua require('Comment.api').toggle_current_linewise()<cr>",
    ["<C-y>"]     = ":%y+",

    ["<M-h>"]     = ":vertical resize +3<cr>",
    ["<M-l>"]     = ":vertical resize -3<cr>",
    ["<M-k>"]     = ":resize +3<cr>",
    ["<M-j>"]     = ":resize -3<cr>",

    ["<Esc>"]     = "<C-\\><C-n>",
  },

  visual_select = {
    ["<C-y>"] = '"+y',
    ["<C-_>"] = ":lua require('Comment.api').toggle_blockwise_op('V', {})<cr>",
  },

  visual_only = {
    ["<C-y>"] = '"+y',
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

local function setup_keymap()
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
