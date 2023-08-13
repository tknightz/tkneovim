local keymaps = {
  normal = {
    ["<Leader>h"] = {
      to          = ":set hlsearch!<CR>",
      opt         = {}
    },
    ["gz"]        = "<Plug>Lightspeed_s",
    ["gZ"]        = "<Plug>Lightspeed_S",

    ["<C-_>"]     = "<Plug>(comment_toggle_linewise_current)",
    ["<C-y>"]     = ":%y+",

    ["<M-Left>"]  = ":vertical resize +3<cr>",
    ["<M-Right>"] = ":vertical resize -3<cr>",
    ["<M-Up>"]    = ":resize +3<cr>",
    ["<M-Down>"]  = ":resize -3<cr>",

    ["<M-h>"]     = ":MoveHChar(-1)<CR>",
    ["<M-l>"]     = ":MoveHChar(1)<CR>",
    ["<M-k>"]     = ":MoveLine(-1)<CR>",
    ["<M-j>"]     = ":MoveLine(1)<CR>",

    ["<Esc>"]     = "<C-\\><C-n>",
    ["S"]         = ":TSJToggle<CR>",
  },

  visual_select = {
    ["<C-y>"] = '"+y',
    ["<C-_>"] = "<Plug>(comment_toggle_blockwise_visual)",

    ['<A-j>'] = ':MoveBlock(1)<CR>',
    ['<A-k>'] = ':MoveBlock(-1)<CR>',
    ['<A-h>'] = ':MoveHBlock(-1)<CR>',
    ['<A-l>'] = ':MoveHBlock(1)<CR>',
  },

  visual_only = {
    ["<C-y>"] = '"+y',
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
