local terminal_group = vim.api.nvim_create_augroup("Terminal", {})
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  group = terminal_group,
  callback = function()
    local filetype = vim.api.nvim_buf_get_option(0, "filetype");
    if filetype == "toggleterm" then
      vim.cmd[[startinsert]]
    end
  end
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

vim.api.nvim_create_augroup('IndentBlankLineFix', {})
vim.api.nvim_create_autocmd('WinScrolled', {
  group = 'IndentBlankLineFix',
  callback = function()
    if vim.v.event.all.leftcol ~= 0 then
      vim.cmd('silent! IndentBlanklineRefresh')
    end
  end,
})
