local terminal_group = vim.api.nvim_create_augroup("Terminal", {})
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "term://*",
  group = terminal_group,
  command = 'startinsert'
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  group = terminal_group,
  command = "setlocal nonumber norelativenumber signcolumn=no"
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local tabpage = vim.api.nvim_get_current_tabpage()
    local tabpage_number = vim.api.nvim_tabpage_get_number(tabpage)
    local win_ids = vim.api.nvim_tabpage_list_wins(tabpage)
    local bufname = vim.fn.expand('%')

    if #win_ids == 1 and bufname == 'NvimTree_' .. tabpage_number then
      vim.api.nvim_exec("quit", false)
    end
  end
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "*",
  callback = function()
    local winbar_value = vim.opt_local.winbar._value
    local is_diff_mode = vim.api.nvim_win_get_option(0, "diff")

    if is_diff_mode and winbar_value == "" then
      vim.opt_local.winbar = "%f "
    end
  end
})
