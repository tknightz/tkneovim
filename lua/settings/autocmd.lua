local special_fts = require("lib.consts").special_fts

local terminal_group = vim.api.nvim_create_augroup("Terminal", {})
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  group = terminal_group,
  callback = function(args)
    if vim.bo.filetype ~= "toggleterm" then
      return
    end

    local mode = vim.api.nvim_get_mode().mode
    if mode == "n" or mode == "nt" then
      -- start insert when enter terminal buf
      -- vim.api.nvim_input('i')
      vim.api.nvim_feedkeys("i", "n", true)
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- copy the location of current file
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("DBEE", function()
  require("dbee").toggle()
end, {})
