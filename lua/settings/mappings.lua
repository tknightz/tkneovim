local build_keymaps = require("lib").build_keymaps

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
  { "<leader>h", "<cmd>set hlsearch!<CR>", desc = "Toggle search highlighting", mode = "n", opts = { silent = true  }},
  { "0", "^", desc = "Start of line", mode = "n" },
  { "<C-y>", '"+y', desc = "Yank to system clipboard", mode = { "n", "v" } },
  { "<C-/>", "gcc", desc = "Toggle line comment", mode = "n", opts = { remap = true }},
  { "<C-_>", "gcc", desc = "Toggle line comment", mode = "n", opts = { remap = true }},
  { "<C-_>", "gc", desc = "Toggle line comment", mode = "v", opts = { remap = true }},
  { "<A-h>", "<cmd>silent! vertical resize +3<cr>", desc = "Increase window width", mode = "n" },
  { "<A-l>", "<cmd>silent! vertical resize -3<cr>", desc = "Decrease window width", mode = "n" },
  {
    "<A-k>",
    function()
      horizontal_resize("up")
    end,
    desc = "Increase window height",
    mode = "n",
  },
  {
    "<A-j>",
    function()
      horizontal_resize("down")
    end,
    desc = "Decrease window height",
    mode = "n",
  },
  { "S", ":TSJToggle<CR>", desc = "Toggle spell check", mode = "n" },

  { "<A-n>", ":MoveLine(1)<CR>", desc = "Move line down", mode = "n" },
  { "<A-p>", ":MoveLine(-1)<CR>", desc = "Move line up", mode = "n" },
  { "<A-n>", ":MoveBlock(1)<CR>", desc = "Move block down", mode = "v" },
  { "<A-p>", ":MoveBlock(-1)<CR>", desc = "Move block up", mode = "v" },
  { "<A-h>", ":MoveHBlock(-1)<CR>", desc = "Move block left", mode = "v" },
  { "<A-l>", ":MoveHBlock(1)<CR>", desc = "Move block right", mode = "v" },

  { "<C-y>", '"+y', desc = "Yank to system clipboard", mode = "x" },

  { "<Esc>", "<C-\\><C-n>", desc = "Escape to normal mode", mode = "t", opts = {}},
}

build_keymaps(nil, keymaps)
