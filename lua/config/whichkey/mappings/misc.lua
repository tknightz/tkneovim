local wk = require("which-key")

local function jump_to_window()
  local window = require("window-picker").pick_window()
  if window ~= nil then
    vim.api.nvim_set_current_win(window)
  end
end

local function execute_http()
  require("kulala").run()
end


wk.add({
  { "<leader>j", jump_to_window, desc = "jump" },
  { "<leader>y", "<cmd>%y+<cr>", desc = "yank to clipboard" },
  { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "neotree" },
  { "<leader>x", execute_http, desc = "execute http"},
})
