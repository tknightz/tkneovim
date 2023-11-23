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

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  group = terminal_group,
  command = "setlocal nonumber norelativenumber signcolumn=no",
})

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("RestNvim", function()
  require("rest-nvim").run()
end, {})
