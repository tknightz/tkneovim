local build_keymaps = require("lib").build_keymaps
local open_todo_float = require("lib.misc").open_todo_float


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
  {
    "<leader>h",
    "<cmd>set hlsearch!<CR>",
    desc = "Toggle search highlighting", icon = "󰍉 ",
    mode = "n",
    opts = { silent = true },
    icon = "󰸱 ",
  },
  { "0", "^", desc = "Start of line", icon = "󰎯 ", mode = "n" },
  { "<C-y>", '"+y', desc = "Yank to system clipboard", mode = { "n", "v" }, icon = "󰅎 " },
  { "<C-/>", "gcc", desc = "Toggle line comment", mode = "n", opts = { remap = true }, icon = "󰅺 " },
  { "<C-_>", "gcc", desc = "Toggle line comment", mode = "n", opts = { remap = true } },
  { "<C-_>", "gc", desc = "Toggle line comment", mode = "v", opts = { remap = true } },
  { "<C-/>", "gc", desc = "Toggle line comment", mode = "v", opts = { remap = true } },
  { "<leader>o", open_todo_float, desc = "Open todo", mode = "n", icon = "󰄬 " },
  { "<A-h>", "<cmd>silent! vertical resize +3<cr>", desc = "Increase window width", mode = "n", icon = "󰩨 " },
  { "<A-l>", "<cmd>silent! vertical resize -3<cr>", desc = "Decrease window width", mode = "n", icon = "󰩩 " },
  {
    "<A-k>",
    function()
      horizontal_resize("up")
    end,
    desc = "Increase window height", icon = "󰩨 ",
    mode = "n",
  },
  {
    "<A-j>",
    function()
      horizontal_resize("down")
    end,
    desc = "Decrease window height", icon = "󰩩 ",
    mode = "n",
  },
  { "S", ":TSJToggle<CR>", desc = "Toggle spell check", mode = "n", icon = "󰓆 " },

  { "<A-n>", ":MoveLine(1)<CR>", desc = "Move line down", mode = "n", icon = "󰜮 " },
  { "<A-p>", ":MoveLine(-1)<CR>", desc = "Move line up", mode = "n", icon = "󰜷 " },
  { "<A-n>", ":MoveBlock(1)<CR>", desc = "Move block down", mode = "v", icon = "󰜮 " },
  { "<A-p>", ":MoveBlock(-1)<CR>", desc = "Move block up", mode = "v", icon = "󰜷 " },
  { "<A-h>", ":MoveHBlock(-1)<CR>", desc = "Move block left", mode = "v", icon = "󰜲 " },
  { "<A-l>", ":MoveHBlock(1)<CR>", desc = "Move block right", mode = "v", icon = "󰜵 " },

  { "<C-y>", '"+y', desc = "Yank to system clipboard", mode = "x" },

  { "<Esc>", "<C-\\><C-n>", desc = "Escape to normal mode", mode = "t", opts = {}, icon = "󰘳 " },

  -- text-objects
}

build_keymaps(nil, keymaps)
