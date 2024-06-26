-- only do horizontal resize if there is a split window above/below
-- the current one
local function horizontal_resize(direction)
  local cur_win_id = vim.api.nvim_get_current_win()
  local cur_win_height = vim.api.nvim_win_get_height(cur_win_id)

  if cur_win_height == vim.api.nvim_get_option("lines") - 3 then
    return
  end

  vim.cmd("silent! resize " .. (direction == "up" and "+3" or "-3"))
end

local keymaps = {
  normal = {
    ["<Leader>h"] = {
      to = ":set hlsearch!<CR>",
      opt = {},
    },
    ["0"] = "^",

    ["<C-y>"] = ":%y+",
    ["<C-_>"] = {
      to = "gcc",
      opt = { remap = true },
    },
    ["<C-/>"] = {
      to = "gcc",
      opt = { remap = true },
    },

    ["<M-h>"] = "<cmd>silent! vertical resize +3<cr>",
    ["<M-l>"] = "<cmd>silent! vertical resize -3<cr>",
    ["<M-k>"] = function() horizontal_resize('up') end,
    ["<M-j>"] = function() horizontal_resize('down') end,

    ["<M-Left>"] = ":MoveHChar(-1)<CR>",
    ["<M-Right>"] = ":MoveHChar(1)<CR>",
    ["<M-Up>"] = ":MoveLine(-1)<CR>",
    ["<M-Down>"] = ":MoveLine(1)<CR>",

    ["<Esc>"] = "<C-\\><C-n>",
    ["S"] = ":TSJToggle<CR>",
  },

  visual_select = {
    ["<C-y>"] = '"+y',
    ["<C-_>"] = {
      to = "gc",
      opt = { remap = true },
    },
    ["<C-/>"] = {
      to = "gc",
      opt = { remap = true },
    },

    ["<A-j>"] = ":MoveBlock(1)<CR>",
    ["<A-k>"] = ":MoveBlock(-1)<CR>",
    ["<A-h>"] = ":MoveHBlock(-1)<CR>",
    ["<A-l>"] = ":MoveHBlock(1)<CR>",
  },

  visual_only = {
    ["<C-y>"] = '"+y',
  },

  terminal = {
    ["<Esc>"] = "<C-\\><C-n>",
  },
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
      vim.keymap.set(named_mode, key, map_to, opt)
    end
  end
end

setup_keymap()
